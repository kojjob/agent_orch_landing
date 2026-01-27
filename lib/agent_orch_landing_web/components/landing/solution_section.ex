defmodule AgentOrchLandingWeb.Landing.SolutionSection do
  use Phoenix.Component

  def solution_section(assigns) do
    ~H"""
    <section id="solution" class="px-6 py-20 lg:px-8">
      <div class="mx-auto max-w-5xl">
        <h2 class="text-center text-3xl font-bold tracking-tight sm:text-4xl text-white" data-animate="fade-up">
          Three pillars. Total control.
        </h2>

        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-3">
          <div class="group text-center" data-animate="fade-up" data-delay="150">
            <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-indigo-600/10 ring-1 ring-indigo-500/30 icon-pulse">
              <svg class="h-8 w-8 text-indigo-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
              </svg>
            </div>
            <h3 class="mt-4 text-xl font-semibold text-white">Orchestrate</h3>
            <p class="mt-2 text-gray-400">
              Define agent workflows with dependency graphs, retry policies, and
              fallback chains. Ship multi-agent systems with confidence.
            </p>
          </div>

          <div class="group text-center" data-animate="fade-up" data-delay="300">
            <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-purple-600/10 ring-1 ring-purple-500/30 icon-pulse">
              <svg class="h-8 w-8 text-purple-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </div>
            <h3 class="mt-4 text-xl font-semibold text-white">Observe</h3>
            <p class="mt-2 text-gray-400">
              Real-time dashboards for every agent. Trace decisions, monitor token
              spend, and catch failures before users do.
            </p>
          </div>

          <div class="group text-center" data-animate="fade-up" data-delay="450">
            <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-pink-600/10 ring-1 ring-pink-500/30 icon-pulse">
              <svg class="h-8 w-8 text-pink-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 3v11.25A2.25 2.25 0 006 16.5h2.25M3.75 3h-1.5m1.5 0h16.5m0 0h1.5m-1.5 0v11.25A2.25 2.25 0 0118 16.5h-2.25m-7.5 0h7.5m-7.5 0l-1 3m8.5-3l1 3m0 0l.5 1.5m-.5-1.5h-9.5m0 0l-.5 1.5" />
              </svg>
            </div>
            <h3 class="mt-4 text-xl font-semibold text-white">Scale</h3>
            <p class="mt-2 text-gray-400">
              Auto-scale agent pools based on demand. Smart routing, load balancing,
              and cost controls built in.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
