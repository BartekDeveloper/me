<script lang="ts">
  import { onMount } from 'svelte';
  import Tabs from '../ui/Tabs.svelte';
  import Card from '../ui/Card.svelte';

  let activeTab = 'education'; // State to control the active tab

  const tabs = [
    { id: 'education', label: 'Education' },
    { id: 'career', label: 'Career' }
  ];

  const education = [
    {
      degree: 'Bachelor of Science in Computer Science',
      school: 'Tech University',
      year: '2018 - 2022',
      description: 'Focus on Software Engineering and Artificial Intelligence. Graduated with Honors.'
    },
    {
      degree: 'Full Stack Web Development Bootcamp',
      school: 'Code Academy',
      year: '2017',
      description: 'Intensive 12-week program covering modern web technologies.'
    }
  ];

  const career = [
    {
      role: 'Senior Frontend Developer',
      company: 'Tech Solutions Inc.',
      year: '2022 - Present',
      description: 'Leading the frontend team, architecting scalable React applications, and mentoring junior developers.'
    },
    {
      role: 'Freelance Web Developer',
      company: 'Self-Employed',
      year: '2020 - 2022',
      description: 'Delivered custom web solutions for various clients, ranging from e-commerce sites to portfolio pages.'
    }
  ];
</script>

<section id="education" class="py-20 relative">
  <div class="max-w-4xl mx-auto px-6">
    <div class="text-center mb-12">
      <h2 class="text-fluid-h1 font-bold text-white">
        My <span class="text-neon-purple">Journey</span>
      </h2>
    </div>

    <Tabs {tabs}>
      {#snippet children(activeTab)}
        <div class="space-y-8">
          {#if activeTab === 'education'}
            {#each education as edu}
              <Card class="border-l-4 border-l-neon-purple border-y-0 border-r-0 rounded-r-xl rounded-l-none bg-gradient-to-r from-neon-purple/10 to-transparent">
                <div class="flex flex-col md:flex-row md:items-center justify-between mb-2">
                  <h3 class="text-xl font-bold text-white">{edu.degree}</h3>
                  <span class="text-neon-purple font-mono text-sm">{edu.year}</span>
                </div>
                <p class="text-gray-300 font-medium mb-2">{edu.school}</p>
                <p class="text-gray-400 text-sm">{edu.description}</p>
              </Card>
            {/each}
          {:else}
            {#each career as job}
              <Card class="border-l-4 border-l-neon-green border-y-0 border-r-0 rounded-r-xl rounded-l-none bg-gradient-to-r from-neon-green/10 to-transparent">
                <div class="flex flex-col md:flex-row md:items-center justify-between mb-2">
                  <h3 class="text-xl font-bold text-white">{job.role}</h3>
                  <span class="text-neon-green font-mono text-sm">{job.year}</span>
                </div>
                <p class="text-gray-300 font-medium mb-2">{job.company}</p>
                <p class="text-gray-400 text-sm">{job.description}</p>
              </Card>
            {/each}
          {/if}
        </div>
      {/snippet}
    </Tabs>
  </div>
</section>