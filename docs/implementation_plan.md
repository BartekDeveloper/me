# Portfolio Website Implementation Plan

## Goal
Create a high-performance, stylish portfolio website using Astro, Svelte, and Drizzle. The design will focus on modern aesthetics with neon accents, glassmorphism, and fluid typography.

## User Review Required
> [!IMPORTANT]
> **Design First Approach**: As requested, I will create design mockups/prototypes *before* building the full site.
> **Tailwind v4**: Will use `tw-` prefix to prevent conflicts with Bootstrap.
> **Bootstrap**: Used alongside Tailwind without extra scoping due to prefix.
> **Runtime**: Using **Bun** for package management and running scripts.

## Proposed Architecture

### Tech Stack
- **Framework**: Astro (SSG + SSR) + Client-side Svelte components for immediate effects.
- **UI Library**: Svelte (interactive components), Motion (animations).
- **Styling**: Tailwind CSS v4 (prefix `tw-`) + Bootstrap.
- **Database**: SQLite (`sqlite3` / `better-sqlite3`) via Drizzle ORM.
- **Server**: Caddy (Reverse Proxy HTTP/3).
- **Containerization**: Docker.

### Design System (Refined)
- **Colors**: Very dark purple-ish backgrounds, grayscale accents, heavy use of gradients and blurs.
- **Typography**: Fluid scales (Utopia.fyi), high contrast.
- **Effects**: Rounded corners, double borders, glows, backdrop blur.

## Proposed Changes

### 1. Project Initialization
#### [NEW] [package.json](file:///home/zota/projects/me/portfolio/package.json)
- Setup Astro with Svelte, Tailwind, and Drizzle dependencies.

#### [NEW] [astro.config.mjs](file:///home/zota/projects/me/portfolio/astro.config.mjs)
- Configure Svelte and Tailwind integrations.

### 2. Design System Implementation
#### [NEW] [src/styles/global.css](file:///home/zota/projects/me/portfolio/src/styles/global.css)
- Define CSS variables for fluid typography and spacing (Utopia).
- Define color palette variables.
- Configure Tailwind v4 theme.

### 3. Component Library
#### [NEW] [src/components/ui/Button.svelte](file:///home/zota/projects/me/portfolio/src/components/ui/Button.svelte)
- Variants: `primary`, `secondary`, `accent`, `outline`, `ghost`, `link`, `nav-link`.
- Props for custom styling and polymorphism (link vs button).

#### [NEW] [src/components/ui/Tabs.svelte](file:///home/zota/projects/me/portfolio/src/components/ui/Tabs.svelte)
- Reusable tab component for "Education & Career" section.

#### [NEW] [src/layouts/MainLayout.astro](file:///home/zota/projects/me/portfolio/src/layouts/MainLayout.astro)
- Global navigation, footer, and background effects.

### 4. Database & Backend
#### [NEW] [drizzle.config.ts](file:///home/zota/projects/me/portfolio/drizzle.config.ts)
- Drizzle configuration.

#### [NEW] [src/db/schema.ts](file:///home/zota/projects/me/portfolio/src/db/schema.ts)
- Define schemas for `projects`, `blogs`, `messages` (contact form).

### 5. Pages
- `src/pages/index.astro` (Home - Single Page Scroll)
    - Sections: Hero, About, Projects, Education/Career (Tabs), Technologies, Contact.
- `src/pages/projects/[slug].astro` (Project Details)
- `src/pages/blog/[slug].astro` (Blog Post)

### 6. Server & Deployment
#### [NEW] [Caddyfile](file:///home/zota/projects/me/portfolio/Caddyfile)
- Configuration for HTTP/3 and reverse proxy.

#### [NEW] [Dockerfile](file:///home/zota/projects/me/portfolio/Dockerfile)
- Multi-stage build using Bun.
- Production-ready image.

## Verification Plan

### Automated Tests
- **Build Check**: Run `bun run build`.
- **Linting**: Run `bun run lint`.
- **Unit/Integration**: Setup Vitest for component and logic testing.

### Manual Verification
- **Design Review**: User to review generated design mockups/prototypes.
- **Responsiveness**: Test on Mobile, Tablet, and Desktop viewports.
- **Performance**: Check Lighthouse score (aiming for 100/100).
- **Interactivity**: Verify Svelte animations and transitions.
