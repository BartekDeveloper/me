Bun.serve({
  port: 4321,
  async fetch(req) {
    const url = new URL(req.url);
    let filePath = url.pathname === "/" ? "/index.html" : url.pathname;
    
    try {
      const file = Bun.file(`./dist${filePath}`);
      if (await file.exists()) {
        return new Response(file);
      }
      
      // Fallback to index.html for SPA routing
      const indexFile = Bun.file("./dist/index.html");
      return new Response(indexFile);
    } catch (err) {
      console.error(err);
      return new Response("Not Found", { status: 404 });
    }
  },
});

console.log("Bun server running on http://localhost:4321");
