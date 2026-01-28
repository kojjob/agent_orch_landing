defmodule AgentOrchLandingWeb.Landing.SocialProofSection do
  use Phoenix.Component

  def social_proof_section(assigns) do
    ~H"""
    <section class="px-6 py-24 lg:py-32 lg:px-8">
      <div class="mx-auto max-w-5xl">
        <div class="text-center" data-animate="fade-up">
          <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
            <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
            Social Proof
          </span>
        </div>
        <h2 class="mt-4 text-center font-[Space_Grotesk] text-3xl font-bold tracking-tight sm:text-4xl text-gray-900 dark:text-white" data-animate="fade-up">
          Built for teams shipping AI agents
        </h2>

        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-2">
          <div class="rounded-xl bg-white/80 dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 hover-lift" data-animate="fade-up" data-delay="150">
            <p class="text-gray-600 dark:text-gray-300 italic">
              "We were spending 40% of engineering time debugging agent failures.
              We need something purpose-built for agent orchestration."
            </p>
            <div class="mt-4 flex items-center gap-3">
              <div class="h-10 w-10 rounded-full bg-indigo-600/20 flex items-center justify-center text-indigo-600 dark:text-indigo-400 font-bold">S</div>
              <div>
                <p class="text-sm font-semibold text-gray-900 dark:text-white">Sarah K.</p>
                <p class="text-sm text-gray-500">ML Platform Lead, Series B Startup</p>
              </div>
            </div>
          </div>

          <div class="rounded-xl bg-white/80 dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 hover-lift" data-animate="fade-up" data-delay="300">
            <p class="text-gray-600 dark:text-gray-300 italic">
              "Our multi-agent system processes 10K tasks/day. Without proper
              orchestration tooling, we'd be flying blind."
            </p>
            <div class="mt-4 flex items-center gap-3">
              <div class="h-10 w-10 rounded-full bg-purple-600/20 flex items-center justify-center text-purple-600 dark:text-purple-400 font-bold">M</div>
              <div>
                <p class="text-sm font-semibold text-gray-900 dark:text-white">Marcus R.</p>
                <p class="text-sm text-gray-500">CTO, AI Automation Agency</p>
              </div>
            </div>
          </div>
        </div>

        <div class="mt-16 text-center">
          <p class="text-sm text-gray-500 uppercase tracking-wider mb-6">Works with your stack</p>
          <div class="flex flex-wrap justify-center gap-8 text-gray-400" data-animate="fade-in" data-delay="200">
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">LangChain</span>
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">CrewAI</span>
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">AutoGen</span>
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">LlamaIndex</span>
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">OpenAI</span>
            <span class="text-lg font-mono hover-shimmer transition-colors cursor-default">Anthropic</span>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
