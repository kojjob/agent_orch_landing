defmodule AgentOrchLandingWeb.Landing.Navbar do
  use Phoenix.Component

  attr :mobile_menu_open, :boolean, default: false
  attr :theme, :string, default: "dark"

  def navbar(assigns) do
    ~H"""
    <nav id="navbar" class="fixed top-0 left-0 right-0 z-50 bg-gray-50/80 dark:bg-gray-950/80 backdrop-blur-lg border-b border-gray-200 dark:border-gray-800/50">
      <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <%!-- Logo --%>
          <a href="/" class="flex items-center gap-2">
            <span class="text-xl font-bold bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
              AgentOrch
            </span>
          </a>

          <%!-- Desktop Nav Links --%>
          <div class="hidden md:flex items-center gap-8">
            <a href="/#solution" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Features</a>
            <a href="/#how-it-works" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">How It Works</a>
            <a href="/#pricing" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Pricing</a>
            <a href="/about" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">About</a>
            <a href="/blog" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Blog</a>
            <a href="/contact" class="text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Contact</a>
          </div>

          <%!-- Desktop CTA + Theme Toggle --%>
          <div class="hidden md:flex items-center gap-3">
            <button
              id="theme-toggle"
              phx-click="toggle_theme"
              class="rounded-lg p-2 text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
              aria-label="Toggle theme"
            >
              <%= if @theme == "dark" do %>
                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />
                </svg>
              <% else %>
                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z" />
                </svg>
              <% end %>
            </button>
            <a href="/#hero" class="rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 px-5 py-2 text-sm font-semibold text-white hover:brightness-110 shadow-lg shadow-indigo-500/25 hover:shadow-indigo-500/40 transition-all">
              Join Waitlist
            </a>
          </div>

          <%!-- Mobile: theme toggle + hamburger --%>
          <div class="flex md:hidden items-center gap-2">
            <button
              phx-click="toggle_theme"
              class="inline-flex items-center justify-center rounded-md p-2 text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white"
              aria-label="Toggle theme"
            >
              <%= if @theme == "dark" do %>
                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />
                </svg>
              <% else %>
                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z" />
                </svg>
              <% end %>
            </button>
            <button
              phx-click="toggle_mobile_menu"
              class="inline-flex items-center justify-center rounded-md p-2 text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white"
              aria-label="Toggle menu"
            >
              <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <%= if @mobile_menu_open do %>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                <% else %>
                  <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                <% end %>
              </svg>
            </button>
          </div>
        </div>
      </div>

      <%!-- Mobile menu --%>
      <%= if @mobile_menu_open do %>
        <div id="mobile-menu" class="md:hidden border-t border-gray-200 dark:border-gray-800/50 bg-gray-50/95 dark:bg-gray-950/95 backdrop-blur-lg">
          <div class="px-6 py-4 space-y-3">
            <a href="/#solution" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Features</a>
            <a href="/#how-it-works" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">How It Works</a>
            <a href="/#pricing" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Pricing</a>
            <a href="/about" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">About</a>
            <a href="/blog" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Blog</a>
            <a href="/contact" class="block text-sm text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition-colors">Contact</a>
            <a href="/#hero" class="mt-3 block rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-2.5 text-center text-sm font-semibold text-white hover:brightness-110 shadow-lg shadow-indigo-500/25 transition-all">
              Join Waitlist
            </a>
          </div>
        </div>
      <% end %>
    </nav>
    """
  end
end
