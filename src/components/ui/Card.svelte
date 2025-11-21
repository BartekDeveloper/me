<script lang="ts">
  import { type Snippet } from 'svelte';

  interface Props {
    class?: string;
    children?: Snippet;
    hoverEffect?: boolean;
    [key: string]: any;
  }

  let { 
    class: className = '', 
    children, 
    hoverEffect = true,
    ...rest 
  }: Props = $props();
</script>

<div 
  class="
    relative group rounded-xl overflow-hidden
    bg-background-card backdrop-blur-xl
    border border-neon-green/30
    shadow-lg shadow-black/50
    {hoverEffect ? 'hover:border-neon-green hover:shadow-[0_0_20px_rgba(57,255,20,0.15)] transition-all duration-500' : ''}
    {className}
  "
  {...rest}
>
  <!-- Inner Border Effect -->
  <div class="absolute inset-[1px] rounded-[10px] border border-white/5 pointer-events-none z-10"></div>
  
  <!-- Content -->
  <div class="relative z-20 p-6 h-full">
    {@render children?.()}
  </div>
  
  <!-- Glow Effect on Hover -->
  {#if hoverEffect}
    <div class="absolute -inset-full top-0 block h-full w-1/2 -skew-x-12 bg-gradient-to-r from-transparent to-white opacity-0 group-hover:animate-shine"></div>
  {/if}
</div>
