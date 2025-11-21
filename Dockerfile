FROM oven/bun:1 AS base
WORKDIR /app

# Install dependencies
FROM base AS deps
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
COPY package.json ./
RUN bun install --frozen-lockfile

# Build the app
FROM base AS build
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN bun run build

# Production image with both Bun and Caddy
FROM caddy:2-alpine AS release

# Install Bun
COPY --from=oven/bun:1 /usr/local/bin/bun /usr/local/bin/bun

# Copy built files and server script
COPY --from=build /app/dist /app/dist
COPY --from=build /app/server.js /app/server.js
COPY Caddyfile /etc/caddy/Caddyfile

# Create entrypoint script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'bun /app/server.js &' >> /entrypoint.sh && \
    echo 'exec caddy run --config /etc/caddy/Caddyfile' >> /entrypoint.sh &&\    chmod +x /entrypoint.sh

EXPOSE 80 443

# Start both Bun server and Caddy
CMD ["/entrypoint.sh"]
