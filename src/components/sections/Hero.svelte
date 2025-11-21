<script lang="ts">
  import Button from '../ui/Button.svelte';
  import { onMount } from 'svelte';
  
  let visible = $state(false);

  onMount(() => {
    visible = true;
  });

  const socialLinks = [
    { 
      name: 'GitHub', 
      url: 'https://github.com',
      color: '#ffffff',
      path: 'M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z'
    },
    { 
      name: 'LinkedIn', 
      url: 'https://linkedin.com',
      color: '#ffffff',
      path: 'M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z'
    },
    { 
      name: 'X', 
      url: 'https://x.com',
      color: '#ffffff',
      path: 'M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z'
    }
  ];
</script>

<section class="min-h-screen flex items-center justify-center relative px-6 py-20 overflow-hidden">
  <!-- Abstract Background Elements -->
  <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-neon-purple/5 rounded-full blur-[100px] pointer-events-none"></div>

  <div class="max-w-7xl mx-auto w-full grid lg:grid-cols-2 gap-12 items-center relative z-10">
    
    <!-- Left Column: Image & Socials -->
    <div class="flex flex-col items-center lg:items-start space-y-8 order-2 lg:order-1 animate-in fade-in slide-in-from-left-8 duration-1000 delay-200 opacity-0 fill-mode-forwards" class:opacity-100={visible}>
      <!-- Profile Image Placeholder (Rounded Square) -->
      <div class="relative group">
        <div class="absolute -inset-1 bg-gradient-to-r from-neon-green to-neon-blue rounded-3xl blur opacity-25 group-hover:opacity-75 transition duration-1000 group-hover:duration-200"></div>
        <div class="relative w-64 h-64 rounded-3xl bg-black border-2 border-white/10 overflow-hidden flex items-center justify-center">
           <!-- Replace with actual image -->
           <div class="absolute inset-0 bg-gradient-to-br from-gray-800 to-black"></div>
           <span class="relative text-4xl font-bold text-white/20">IMG</span>
        </div>
      </div>

      <!-- Social Links with Brand Colors -->
      <div class="flex gap-4">
        {#each socialLinks as social}
          <a 
            href={social.url} 
            target="_blank" 
            rel="noopener noreferrer"
            class="w-12 h-12 flex items-center justify-center rounded-full bg-white/5 border border-white/10 transition-all duration-300 hover:scale-110 group
              {social.name === 'LinkedIn' ? 'hover:bg-[#1DA1F2] hover:border-[#1DA1F2]' : 'hover:border-white/30 hover:bg-white/10'}"
            aria-label={social.name}
          >
            <svg role="img" viewBox="0 0 24 24" class="w-5 h-5 transition-colors" fill="currentColor" style="color: {social.color};" xmlns="http://www.w3.org/2000/svg">
              <path d={social.path} />
            </svg>
          </a>
        {/each}
      </div>
    </div>

    <!-- Right Column: Content -->
    <div class="text-center lg:text-left space-y-8 order-1 lg:order-2">
      <!-- Intro Badge -->
      <div class="inline-block animate-in fade-in slide-in-from-top-4 duration-700 delay-100 opacity-0 fill-mode-forwards" class:opacity-100={visible}>
        <span class="px-4 py-1.5 rounded-full border border-neon-green/30 bg-neon-green/5 text-neon-green text-sm font-medium tracking-wide backdrop-blur-md">
          Available for work
        </span>
      </div>

      <!-- Main Heading -->
      <h1 class="text-fluid-h1 font-bold tracking-tight leading-none animate-in fade-in zoom-in-95 duration-1000 delay-300 opacity-0 fill-mode-forwards" class:opacity-100={visible}>
        <span class="block text-white drop-shadow-[0_0_15px_rgba(255,255,255,0.1)]">Building the</span>
        <span class="block bg-clip-text text-transparent bg-gradient-to-r from-neon-green via-white to-neon-purple drop-shadow-[0_0_30px_rgba(57,255,20,0.3)]">
          Digital Future
        </span>
      </h1>

      <!-- Bio Text (Trimmed) -->
      <div class="space-y-4 animate-in fade-in slide-in-from-bottom-4 duration-700 delay-500 opacity-0 fill-mode-forwards" class:opacity-100={visible}>
        <p class="text-xl text-gray-300 leading-relaxed">
          I'm <span class="text-white font-semibold">Zota</span>. A full-stack developer and designer crafting immersive web experiences.
        </p>
        <p class="text-lg text-gray-400 leading-relaxed max-w-2xl mx-auto lg:mx-0">
          I specialize in performance, accessibility, and user experience, building visually stunning applications with the modern web stack.
        </p>
      </div>

      <!-- CTA Buttons -->
      <div class="flex flex-wrap items-center justify-center lg:justify-start gap-4 animate-in fade-in slide-in-from-bottom-8 duration-700 delay-700 opacity-0 fill-mode-forwards" class:opacity-100={visible}>
        <Button variant="primary" size="lg" href="#projects">
          View My Work
        </Button>
        <Button variant="secondary" size="lg" href="#contact">
          Contact Me
        </Button>
      </div>
    </div>
  </div>

  <!-- Scroll Indicator -->
  <div class="absolute bottom-10 left-1/2 -translate-x-1/2 animate-bounce delay-1000 opacity-0 animate-in fade-in duration-1000 fill-mode-forwards" class:opacity-100={visible}>
    <div class="w-6 h-10 rounded-full border-2 border-white/20 flex items-start justify-center p-1">
      <div class="w-1 h-2 bg-neon-green rounded-full animate-scroll"></div>
    </div>
  </div>
</section>
