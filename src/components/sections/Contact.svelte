<script lang="ts">
  import Button from '../ui/Button.svelte';
  import Card from '../ui/Card.svelte';
</script>

<section id="contact" class="py-20 relative">
  <div class="max-w-4xl mx-auto px-6">
    <div class="text-center mb-16">
      <h2 class="text-fluid-h1 font-bold text-white">
        Get In <span class="text-neon-red">Touch</span>
      </h2>
      <p class="text-gray-400">Have a project in mind or just want to say hi?</p>
    </div>

    <div class="grid md:grid-cols-2 gap-12">
      <!-- Contact Form -->
      <Card class="border-neon-red/20">
        <form class="space-y-6">
          <div class="space-y-2">
            <label for="name" class="text-sm font-medium text-gray-300">Name</label>
            <input type="text" id="name" class="w-full px-4 py-3 rounded-lg bg-black/50 border border-white/10 focus:border-neon-red focus:ring-1 focus:ring-neon-red outline-none transition-all text-white" placeholder="Your Name" />
          </div>
          
          <div class="space-y-2">
            <label for="email" class="text-sm font-medium text-gray-300">Email</label>
            <input type="email" id="email" class="w-full px-4 py-3 rounded-lg bg-black/50 border border-white/10 focus:border-neon-red focus:ring-1 focus:ring-neon-red outline-none transition-all text-white" placeholder="your@email.com" />
          </div>

          <div class="space-y-2">
            <label for="message" class="text-sm font-medium text-gray-300">Message</label>
            <textarea id="message" rows="4" class="w-full px-4 py-3 rounded-lg bg-black/50 border border-white/10 focus:border-neon-red focus:ring-1 focus:ring-neon-red outline-none transition-all text-white" placeholder="Hello..."></textarea>
          </div>

          <Button variant="primary" class="w-full bg-neon-red border-neon-red text-black hover:shadow-[0_0_15px_var(--color-neon-red)]">
            Send Message
          </Button>
        </form>
      </Card>

      <!-- Social / Info -->
      <div class="space-y-8 flex flex-col justify-center">
        <div class="space-y-4">
          <h3 class="text-2xl font-bold text-white">Let's Connect</h3>
          <p class="text-gray-400 leading-relaxed">
            I'm currently available for freelance work and open to new opportunities. 
            Feel free to reach out via the form or my social channels.
          </p>
        </div>

        <div class="space-y-4">
          <a href="https://github.com/Zota0" target="_blank" class="flex items-center space-x-4 p-4 rounded-lg bg-white/5 hover:bg-white/10 transition-colors group">
            <div class="w-10 h-10 rounded-full bg-black flex items-center justify-center border border-white/10 group-hover:border-neon-green">
              <span class="text-xl">🐙</span>
            </div>
            <div>
              <p class="font-bold text-white">GitHub (Zota0)</p>
              <p class="text-sm text-gray-400">Check out my code</p>
            </div>
          </a>

          <a href="https://github.com/BartekDeveloper" target="_blank" class="flex items-center space-x-4 p-4 rounded-lg bg-white/5 hover:bg-white/10 transition-colors group">
            <div class="w-10 h-10 rounded-full bg-black flex items-center justify-center border border-white/10 group-hover:border-neon-purple">
              <span class="text-xl">💻</span>
            </div>
            <div>
              <p class="font-bold text-white">GitHub (BartekDeveloper)</p>
              <p class="text-sm text-gray-400">More projects</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
