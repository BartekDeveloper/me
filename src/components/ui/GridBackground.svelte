<script>
  import { onMount } from 'svelte';
  let cursorX = 0;
  let cursorY = 0;
  function handleMouse(e) {
    cursorX = e.clientX;
    cursorY = e.clientY;
  }
  onMount(() => {
    window.addEventListener('mousemove', handleMouse);
    return () => window.removeEventListener('mousemove', handleMouse);
  });
</script>

<div class="absolute inset-0 z-0 w-full h-full overflow-hidden pointer-events-none" style="--cursor-x: {cursorX}px; --cursor-y: {cursorY}px;">
  <!-- Static Grid (no animation) -->
  <div class="absolute inset-0 bg-[linear-gradient(to_right,rgba(120,120,120,0.6)_1px,transparent_1px),linear-gradient(to_bottom,rgba(120,120,120,0.6)_1px,transparent_1px)] bg-[size:4rem_4rem] bg-fixed"></div>
  <!-- Flicker overlay, masked to cursor area -->
   <div class="absolute inset-0 bg-white/10 animate-grid-flicker"
        style="mask-image: radial-gradient(circle 120px at var(--cursor-x) var(--cursor-y), white, transparent); -webkit-mask-image: radial-gradient(circle 120px at var(--cursor-x) var(--cursor-y), white, transparent);"></div>
  <!-- Vignette / Fade Mask -->
  <div class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-black/80"></div>
  <div class="absolute inset-0 bg-[radial-gradient(circle_800px_at_50%_50%,rgba(188,19,254,0.15),transparent)]"></div>
</div>

<style>
  @keyframes grid-flicker {
    0%, 100% { opacity: 0.05; }
    50% { opacity: 0.15; }
  }
  .animate-grid-flicker { animation: grid-flicker 2s ease-in-out infinite; }
</style>
