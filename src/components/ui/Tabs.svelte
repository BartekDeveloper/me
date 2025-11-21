<script lang="ts">
  import { type Snippet } from 'svelte';
  import Button from './Button.svelte';

  interface Tab {
    id: string;
    label: string;
  }

  interface Props {
    tabs: Tab[];
    activeTab?: string;
    class?: string;
    children?: Snippet<[string]>; // Pass activeTab id to children
  }

  let { 
    tabs, 
    activeTab = $bindable(tabs[0].id), 
    class: className = '', 
    children 
  }: Props = $props();
</script>

<div class="flex flex-col w-full {className}">
  <!-- Tab List -->
  <div class="flex space-x-2 mb-6 p-1 bg-white/5 rounded-lg w-fit self-center backdrop-blur-sm border border-white/10">
    {#each tabs as tab}
      <button
        onclick={() => activeTab = tab.id}
        class="
          px-6 py-2 rounded-md text-sm font-medium transition-all duration-300
          {activeTab === tab.id 
            ? 'bg-neon-green text-black shadow-[0_0_10px_rgba(57,255,20,0.4)]' 
            : 'text-gray-400 hover:text-white hover:bg-white/5'}
        "
      >
        {tab.label}
      </button>
    {/each}
  </div>

  <!-- Tab Content -->
  <div class="w-full animate-in fade-in slide-in-from-bottom-4 duration-500">
    {@render children?.(activeTab)}
  </div>
</div>
