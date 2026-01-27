defmodule AgentOrchLandingWeb.Landing.Navbar do
  use Phoenix.Component

  attr :mobile_menu_open, :boolean, default: false

  def navbar(assigns) do
    ~H"""
    <nav id="navbar" class="fixed top-0 left-0 right-0 z-50 bg-gray-950/80 backdrop-blur-lg border-b border-gray-800/50">
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
            <a href="#solution" class="text-sm text-gray-300 hover:text-white transition-colors">Features</a>
            <a href="#how-it-works" class="text-sm text-gray-300 hover:text-white transition-colors">How It Works</a>
            <a href="#pricing" class="text-sm text-gray-300 hover:text-white transition-colors">Pricing</a>
          </div>

          <%!-- Desktop CTA --%>
          <div class="hidden md:flex items-center">
            <a href="#hero" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors">
              Join Waitlist
            </a>
          </div>

          <%!-- Mobile menu button --%>
          <button
            phx-click="toggle_mobile_menu"
            class="md:hidden inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:text-white"
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

      <%!-- Mobile menu --%>
      <%= if @mobile_menu_open do %>
        <div id="mobile-menu" class="md:hidden border-t border-gray-800/50">
          <div class="px-6 py-4 space-y-3">
            <a href="#solution" class="block text-sm text-gray-300 hover:text-white transition-colors">Features</a>
            <a href="#how-it-works" class="block text-sm text-gray-300 hover:text-white transition-colors">How It Works</a>
            <a href="#pricing" class="block text-sm text-gray-300 hover:text-white transition-colors">Pricing</a>
            <a href="#hero" class="mt-3 block rounded-lg bg-indigo-600 px-4 py-2 text-center text-sm font-semibold text-white hover:bg-indigo-500 transition-colors">
              Join Waitlist
            </a>
          </div>
        </div>
      <% end %>
    </nav>
    """
  end
end
