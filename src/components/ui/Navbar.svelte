<script lang="ts">
  import { onMount } from 'svelte';
  
  let scrollY = 0;
  let innerWidth = 0;
  
  // Scroll Animation Logic
  $: isScrolled = scrollY > 50;
  // Slower transition (duration-700), separate states clearly
  $: navClasses = isScrolled 
    ? "py-3 px-8 w-[85%] max-w-4xl top-6 rounded-full glass-liquid shadow-2xl border-white/10" 
    : "py-8 px-0 w-full max-w-7xl top-0 rounded-none bg-transparent border-transparent";

  function handleTabClick(tab: string) {
    window.location.href = `/#${tab}`;
    // If we are already on home, we might need to trigger the hash change manually if it doesn't happen
    if (window.location.pathname === '/') {
       window.dispatchEvent(new HashChangeEvent('hashchange'));
    }
  }
</script>

<svelte:window bind:scrollY bind:innerWidth />

<nav class="fixed left-1/2 -translate-x-1/2 z-50 transition-all duration-700 ease-[cubic-bezier(0.25,0.1,0.25,1.0)] {navClasses}">
  <div class="flex items-center justify-between w-full">
    <!-- Logo (SVG) -->
    <a href="/" class="flex items-center gap-2 group relative">
      <img src="/logo.svg" alt="ZOTA" class="h-10 w-auto transition-transform duration-300 group-hover:scale-105 group-hover:drop-shadow-[0_0_10px_rgba(57,255,20,0.5)]" />
    </a>

    <!-- Desktop Navigation -->
    <div class="hidden md:flex items-center gap-2">
      <a href="/#about" class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition-all">About</a>
      <a href="/#projects" class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition-all">Projects</a>
      <a href="/blog" class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition-all">Blog</a>
      
      <!-- Split Education/Career -->
      <button on:click={() => handleTabClick('education')} class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition-all">Education</button>
      <button on:click={() => handleTabClick('career')} class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition-all">Career</button>
    </div>

    <!-- CTA -->
    <div class="hidden md:block">
      <a href="/#contact" class="inline-flex items-center justify-center px-6 py-2.5 text-sm font-medium rounded-lg bg-gradient-to-r from-blue-500 to-indigo-500 text-white border border-neon-green shadow-[inset_0_0_0_1px_rgba(30,58,138,0.2)] hover:shadow-[0_0_20px_rgba(59,130,246,0.4),inset_0_0_0_1px_rgba(30,58,138,0.3)] hover:scale-105 transition-all duration-300 whitespace-nowrap">
        CONTACT ME
      </a>
    </div>

    <!-- Mobile Menu Button (Placeholder) -->
    <button class="md:hidden text-white p-2" aria-label="Open mobile menu">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
      </svg>
    </button>
  </div>
</nav>
