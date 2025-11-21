<script lang="ts">
  import { type Snippet } from 'svelte';

  type Variant = 'primary' | 'secondary' | 'accent' | 'outline' | 'ghost' | 'link' | 'nav-link' | 'custom';
  type Size = 'sm' | 'md' | 'lg';

  interface Props {
    variant?: Variant;
    size?: Size;
    href?: string;
    class?: string;
    children?: Snippet;
    [key: string]: any;
  }

  let { 
    variant = 'primary', 
    size = 'md', 
    href, 
    class: className = '', 
    children, 
    ...rest 
  }: Props = $props();

  const baseStyles = "inline-flex items-center justify-center rounded-lg font-medium transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-black disabled:opacity-50 disabled:pointer-events-none cursor-pointer whitespace-nowrap relative";
  
  const variants = {
    // Primary: Cyan/Teal gradient with multi-layer borders
    primary: "bg-gradient-to-r from-cyan-500 to-teal-500 text-black border border-neon-green shadow-[inset_0_0_0_1px_rgba(6,78,59,0.2)] hover:shadow-[0_0_20px_rgba(6,217,217,0.4),inset_0_0_0_1px_rgba(6,78,59,0.3)] hover:scale-105",
    
    // Secondary: Blue gradient with multi-layer borders
    secondary: "bg-gradient-to-r from-blue-500 to-indigo-500 text-white border border-neon-green shadow-[inset_0_0_0_1px_rgba(30,58,138,0.2)] hover:shadow-[0_0_20px_rgba(59,130,246,0.4),inset_0_0_0_1px_rgba(30,58,138,0.3)] hover:scale-105",
    
    // Accent: Red/Pink gradient with multi-layer borders
    accent: "bg-gradient-to-r from-red-500 to-pink-500 text-white border border-neon-green shadow-[inset_0_0_0_1px_rgba(127,29,29,0.2)] hover:shadow-[0_0_20px_rgba(239,68,68,0.4),inset_0_0_0_1px_rgba(127,29,29,0.3)] hover:scale-105",
    
    // Outline: Transparent with lime border and dark green inner border
    outline: "bg-transparent text-gray-200 border border-neon-green shadow-[inset_0_0_0_1px_rgba(6,78,59,0.15)] hover:bg-neon-green/5 hover:text-white hover:shadow-[0_0_15px_rgba(57,255,20,0.3),inset_0_0_0_1px_rgba(6,78,59,0.25)]",
    
    // Ghost: Minimal style
    ghost: "bg-transparent text-gray-300 hover:bg-white/5 hover:text-white border border-transparent",
    
    // Link: Text-only button
    link: "bg-transparent text-neon-green hover:text-white hover:underline border border-transparent",
    
    // Nav-link: For navbar
    "nav-link": "bg-transparent text-gray-300 hover:text-white border border-transparent hover:bg-white/5",
    
    custom: ""
  };

  const sizes = {
    sm: "h-8 px-3 text-sm",
    md: "h-10 px-5 text-base",
    lg: "h-12 px-8 text-lg"
  };

  // Nav-link specific adjustments
  const finalSize = variant === 'nav-link' || variant === 'link' ? 'px-3 py-2' : sizes[size];
</script>

{#if href}
  <a 
    {href} 
    class="{baseStyles} {variants[variant]} {finalSize} {className}" 
    {...rest}
  >
    {@render children?.()}
  </a>
{:else}
  <button 
    class="{baseStyles} {variants[variant]} {finalSize} {className}" 
    {...rest}
  >
    {@render children?.()}
  </button>
{/if}
