<script lang="ts">
  import Card from '../ui/Card.svelte';

  const technologies = [
    { 
      category: "Frontend",
      items: [
        { name: "Svelte", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/svelte/svelte-original.svg" },
        { name: "Astro", url: "https://astro.build/assets/press/astro-icon-light.svg" },
        { name: "Tailwind CSS", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-original.svg" },
        { name: "TypeScript", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" }
      ]
    },
    {
      category: "Backend",
      items: [
        { name: "Bun", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bun/bun-original.svg" },
        { name: "Drizzle", url: "https://avatars.githubusercontent.com/u/108468352?s=200&v=4" },
        { name: "SQLite", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg" }
      ]
    },
    {
      category: "Tools",
      items: [
        { name: "Docker", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" },
        { name: "Git", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" },
        { name: "Linux", url: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" }
      ]
    }
  ];
</script>

<section id="technologies" class="py-32 relative">
  <div class="max-w-7xl mx-auto px-6">
    <h2 class="text-fluid-h1 font-bold mb-16 text-center">
      <span class="text-transparent bg-clip-text bg-gradient-to-r from-white to-gray-500">Tech</span>
      <span class="text-neon-green">Stack</span>
    </h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      {#each technologies as category}
        <Card hoverEffect={false} class="p-8">
          <h3 class="text-2xl font-bold mb-6 text-neon-purple">{category.category}</h3>
          <div class="grid grid-cols-3 gap-4">
            {#each category.items as item}
              <div class="flex flex-col items-center gap-2">
                <div class="w-12 h-12 p-2 rounded-xl bg-white/5 border border-white/10 hover:border-neon-green/50 hover:bg-neon-green/10 hover:scale-110 transition-all duration-300 flex items-center justify-center">
                  <div class="w-full h-full flex items-center justify-center">
                    <img src={item.url} alt={item.name} class="w-full h-full object-contain" loading="lazy" />
                  </div>
                </div>
                <span class="text-xs text-gray-400 hover:text-white transition-colors text-center">{item.name}</span>
              </div>
            {/each}
          </div>
        </Card>
      {/each}
    </div>
  </div>
</section>
