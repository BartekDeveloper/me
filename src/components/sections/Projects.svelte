<script lang="ts">
  import Card from '../ui/Card.svelte';
  import Button from '../ui/Button.svelte';
  import * as icons from 'simple-icons';

  type ProjectType = 'open-source' | 'open-docs' | 'closed-source' | 'contributed';

  interface Project {
    title: string;
    description: string;
    tags: string[];
    type: ProjectType;
    image: string; // CSS class for gradient or URL
    links: {
      about?: string; // Internal link /projects/{id} - Optional for contributed
      source?: string; // GitHub etc.
      docs?: string; // Documentation link
      website?: string; // Live website
      stats?: string; // Link to statistics for contributed
      project?: string; // Direct project link for contributed
    };
  }

  const projects: Project[] = [
    {
      title: 'Portfolio v2',
      description: 'My personal portfolio built with Astro, Svelte, and Tailwind v4. Features a custom design system and high-performance rendering.',
      tags: ['Astro', 'Svelte', 'Tailwind'],
      type: 'open-source',
      image: 'bg-gradient-to-br from-neon-green/20 to-black',
      links: {
        about: '/projects/portfolio',
        source: 'https://github.com/zota/portfolio'
      }
    },
    {
      title: 'Drizzle ORM Docs',
      description: 'Contributed to the documentation of Drizzle ORM, improving clarity on SQLite schema definitions.',
      tags: ['Documentation', 'TypeScript', 'SQL'],
      type: 'open-docs',
      image: 'bg-gradient-to-br from-neon-blue/20 to-black',
      links: {
        about: '/projects/drizzle-docs',
        docs: 'https://orm.drizzle.team'
      }
    },
    {
      title: 'Enterprise CRM',
      description: 'A scalable CRM solution for a logistics company, handling over 10k daily transactions.',
      tags: ['React', 'Node.js', 'PostgreSQL'],
      type: 'closed-source',
      image: 'bg-gradient-to-br from-neon-purple/20 to-black',
      links: {
        about: '/projects/crm',
        website: 'https://crm.example.com'
      }
    },
    {
      title: 'Bun Runtime',
      description: 'Fixed a critical bug in the Bun runtime related to WebSocket connections.',
      tags: ['Zig', 'C++', 'Performance'],
      type: 'contributed',
      image: 'bg-gradient-to-br from-neon-yellow/20 to-black',
      links: {
        project: 'https://bun.sh',
        stats: 'https://github.com/oven-sh/bun/pulls?q=is%3Apr+author%3Azota'
      }
    }
  ];

  const getTypeLabel = (type: ProjectType) => {
    switch (type) {
      case 'open-source': return 'Open Source';
      case 'open-docs': return 'Open Docs';
      case 'closed-source': return 'Closed Source';
      case 'contributed': return 'Contributed';
    }
  };

  const getTypeColor = (type: ProjectType) => {
    switch (type) {
      case 'open-source': return 'text-neon-green border-neon-green/50 bg-neon-green/10';
      case 'open-docs': return 'text-neon-blue border-neon-blue/50 bg-neon-blue/10';
      case 'closed-source': return 'text-neon-purple border-neon-purple/50 bg-neon-purple/10';
      case 'contributed': return 'text-neon-yellow border-neon-yellow/50 bg-neon-yellow/10';
    }
  };
</script>

<section id="projects" class="py-32 relative">
  <div class="max-w-7xl mx-auto px-6">
    <div class="text-center mb-20 space-y-4">
      <h2 class="text-fluid-h1 font-bold text-white">
        Featured <span class="text-neon-green">Projects</span>
      </h2>
      <p class="text-gray-400 max-w-2xl mx-auto text-lg">
        A collection of my work, ranging from open-source contributions to enterprise solutions.
      </p>
    </div>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
      {#each projects as project}
        <Card class="h-full flex flex-col p-0 group relative overflow-hidden border-0 bg-background-card">
          <!-- Image Section -->
          <div class="w-full aspect-video relative overflow-hidden {project.image}">
             <!-- Placeholder for actual image -->
             <div class="absolute inset-0 flex items-center justify-center text-white/10 font-bold text-4xl">IMG</div>
             
             <!-- Type Badge (Overlaid on Image) -->
             <div class="absolute top-4 right-4 px-3 py-1 rounded-full text-xs font-bold border uppercase tracking-wider bg-black/50 backdrop-blur-md {getTypeColor(project.type)}">
              {getTypeLabel(project.type)}
            </div>
          </div>

          <div class="p-8 flex flex-col flex-grow">
            <h3 class="text-2xl font-bold text-white mb-3 group-hover:text-neon-green transition-colors">{project.title}</h3>
            <p class="text-gray-400 mb-6 leading-relaxed flex-grow text-sm">{project.description}</p>

            <!-- Tags -->
            <div class="flex flex-wrap gap-2 mb-8">
              {#each project.tags as tag}
                <span class="px-2 py-1 rounded-md text-[10px] font-medium bg-white/5 text-gray-300 border border-white/10 group-hover:border-white/20 transition-colors">
                  {tag}
                </span>
              {/each}
            </div>

            <!-- Actions -->
            <div class="flex flex-col sm:flex-row gap-3 mt-auto">
              {#if project.type === 'contributed'}
                 <!-- Contributed: Project Link + Stats Link -->
                 <Button variant="secondary" href={project.links.project} target="_blank" class="w-full sm:w-1/2 text-sm px-2">
                    View Project
                 </Button>
                 <Button variant="outline" href={project.links.stats} target="_blank" class="w-full sm:w-1/2 text-sm px-2">
                    View Stats
                 </Button>
              {:else}
                <!-- Others: About Project + Specific Action -->
                <Button variant="secondary" href={project.links.about} class="w-full sm:w-1/2 text-sm px-2">
                  About Project
                </Button>

                {#if project.type === 'open-source' && project.links.source}
                  <Button variant="primary" href={project.links.source} target="_blank" class="w-full sm:w-1/2 text-sm px-2">
                    View Source
                  </Button>
                {:else if project.type === 'open-docs' && project.links.docs}
                  <Button variant="primary" href={project.links.docs} target="_blank" class="w-full sm:w-1/2 text-sm px-2">
                    View Docs
                  </Button>
                {:else if project.type === 'closed-source' && project.links.website}
                  <Button variant="primary" href={project.links.website} target="_blank" class="w-full sm:w-1/2 text-sm px-2">
                    View Website
                  </Button>
                {/if}
              {/if}
            </div>
          </div>
        </Card>
      {/each}
    </div>
  </div>
</section>
