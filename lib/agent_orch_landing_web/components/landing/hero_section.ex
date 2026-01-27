defmodule AgentOrchLandingWeb.Landing.HeroSection do
  use Phoenix.Component
  import AgentOrchLandingWeb.CoreComponents

  attr :headline, :string, required: true
  attr :form, :any, required: true
  attr :submitted, :boolean, default: false

  def hero_section(assigns) do
    ~H"""
    <section class="relative overflow-hidden px-6 py-24 sm:py-32 lg:px-8">
      <div class="absolute inset-0 bg-gradient-to-br from-indigo-950 via-gray-950 to-purple-950"></div>
      <div class="relative mx-auto max-w-3xl text-center" data-animate="hero" data-delay="100">
        <h1 class="text-4xl font-bold tracking-tight sm:text-6xl bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
          {@headline}
        </h1>
        <p class="mt-6 text-lg leading-8 text-gray-300" data-animate="fade-up" data-delay="300">
          The orchestration platform that gives you full visibility and control over your AI agent fleet.
          Monitor, coordinate, and scale — from prototype to production.
        </p>

        <div class="mt-10" data-animate="fade-up" data-delay="500">
          <%= if @submitted do %>
            <div class="inline-flex items-center gap-2 rounded-full bg-green-500/10 px-6 py-3 text-green-400 ring-1 ring-green-500/30">
              <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
              </svg>
              You're on the waitlist!
            </div>
          <% else %>
            <.form for={@form} phx-submit="submit_email" phx-change="validate_email" class="flex flex-col sm:flex-row gap-3 justify-center max-w-md mx-auto">
              <div class="flex-1">
                <.input
                  field={@form[:email]}
                  type="email"
                  placeholder="you@company.com"
                  required
                  class="py-2.5 px-4 bg-gray-800/80 border-gray-600 text-white placeholder:text-gray-500 focus:border-indigo-500 focus:ring-indigo-500/20 focus:ring-2 focus:outline-none transition-colors"
                />
              </div>
              <button type="submit" class="rounded-lg bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white shadow-lg shadow-indigo-500/25 hover:bg-indigo-500 hover:shadow-indigo-500/40 active:scale-[0.98] transition-all whitespace-nowrap">
                Join Waitlist
              </button>
            </.form>
          <% end %>
        </div>
      </div>
    </section>
    """
  end
end
