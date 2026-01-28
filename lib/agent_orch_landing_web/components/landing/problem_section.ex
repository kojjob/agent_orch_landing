defmodule AgentOrchLandingWeb.Landing.ProblemSection do
  use Phoenix.Component

  def problem_section(assigns) do
    ~H"""
    <section class="px-6 py-24 lg:py-32 lg:px-8 bg-gray-50 dark:bg-gray-900/50">
      <div class="mx-auto max-w-5xl">
        <div class="text-center" data-animate="fade-up">
          <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
            <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
            The Problem
          </span>
        </div>
        <h2 class="mt-4 text-center font-[Space_Grotesk] text-3xl font-bold tracking-tight sm:text-4xl text-gray-900 dark:text-white" data-animate="fade-up">
          Running AI agents in production is painful
        </h2>
        <p class="mt-6 text-center text-gray-500 dark:text-gray-400 text-lg" data-animate="fade-up" data-delay="100">
          Sound familiar?
        </p>

        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-3">
          <div class="group rounded-xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 hover-lift hover-glow" data-animate="fade-up" data-delay="150">
            <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-red-500/10 ring-1 ring-red-500/25 icon-pulse">
              <svg class="h-6 w-6 text-red-500 dark:text-red-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12c1.292 4.338 5.31 7.5 10.066 7.5.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88" />
              </svg>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Blind in Production</h3>
            <p class="mt-2 text-gray-500 dark:text-gray-400">
              Agents fail silently. You find out from customers, not dashboards.
              No visibility into what your agents are actually doing.
            </p>
          </div>

          <div class="group rounded-xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 hover-lift hover-glow" data-animate="fade-up" data-delay="300">
            <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-amber-500/10 ring-1 ring-amber-500/25 icon-pulse">
              <svg class="h-6 w-6 text-amber-500 dark:text-amber-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
              </svg>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Fragile Coordination</h3>
            <p class="mt-2 text-gray-500 dark:text-gray-400">
              Multi-agent workflows break constantly. One agent's failure cascades
              through your entire pipeline with no recovery.
            </p>
          </div>

          <div class="group rounded-xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 hover-lift hover-glow" data-animate="fade-up" data-delay="450">
            <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-orange-500/10 ring-1 ring-orange-500/25 icon-pulse">
              <svg class="h-6 w-6 text-orange-500 dark:text-orange-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
              </svg>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Cost Black Hole</h3>
            <p class="mt-2 text-gray-500 dark:text-gray-400">
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
