defmodule AgentOrchLandingWeb.Landing.ProblemSection do
  use Phoenix.Component

  def problem_section(assigns) do
    ~H"""
    <section class="px-6 py-20 lg:px-8 bg-gray-900/50">
      <div class="mx-auto max-w-5xl">
        <h2 class="text-center text-3xl font-bold tracking-tight sm:text-4xl text-white">
          Running AI agents in production is painful
        </h2>
        <p class="mt-4 text-center text-gray-400 text-lg">
          Sound familiar?
        </p>

        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-3">
          <div class="rounded-xl bg-gray-800/50 p-8 ring-1 ring-gray-700/50">
            <div class="text-3xl mb-4">🙈</div>
            <h3 class="text-lg font-semibold text-white">Blind in Production</h3>
            <p class="mt-2 text-gray-400">
              Agents fail silently. You find out from customers, not dashboards.
              No visibility into what your agents are actually doing.
            </p>
          </div>

          <div class="rounded-xl bg-gray-800/50 p-8 ring-1 ring-gray-700/50">
            <div class="text-3xl mb-4">💥</div>
            <h3 class="text-lg font-semibold text-white">Fragile Coordination</h3>
            <p class="mt-2 text-gray-400">
              Multi-agent workflows break constantly. One agent's failure cascades
              through your entire pipeline with no recovery.
            </p>
          </div>

          <div class="rounded-xl bg-gray-800/50 p-8 ring-1 ring-gray-700/50">
            <div class="text-3xl mb-4">🔥</div>
            <h3 class="text-lg font-semibold text-white">Cost Black Hole</h3>
            <p class="mt-2 text-gray-400">
              Token spend spirals with no insight into which agents are burning
              budget. You're optimizing in the dark.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
