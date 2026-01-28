defmodule AgentOrchLandingWeb.Landing.HowItWorksSection do
  use Phoenix.Component
  import Phoenix.HTML, only: [raw: 1]

  @code_snippet """
  <span class="text-purple-400">from</span> agentorch <span class="text-purple-400">import</span> Workflow, Agent

  <span class="text-gray-500"># Define agents</span>
  researcher = Agent(<span class="text-green-400">"researcher"</span>, model=<span class="text-green-400">"gpt-4"</span>)
  writer = Agent(<span class="text-green-400">"writer"</span>, model=<span class="text-green-400">"claude-3"</span>)
  reviewer = Agent(<span class="text-green-400">"reviewer"</span>, model=<span class="text-green-400">"gpt-4"</span>)

  <span class="text-gray-500"># Build workflow</span>
  flow = Workflow(<span class="text-green-400">"content-pipeline"</span>)
  flow.add(researcher, retries=<span class="text-yellow-400">3</span>)
  flow.add(writer, depends_on=[researcher])
  flow.add(reviewer, depends_on=[writer])

  <span class="text-gray-500"># Deploy with full observability</span>
  flow.deploy(alerts=<span class="text-yellow-400">True</span>, cost_limit=<span class="text-yellow-400">50.0</span>)
  """

  def how_it_works_section(assigns) do
    assigns = assign(assigns, :code_snippet, @code_snippet)

    ~H"""
    <section id="how-it-works" class="px-6 py-24 lg:py-32 lg:px-8 bg-gray-100/60 dark:bg-gray-900/50">
      <div class="mx-auto max-w-5xl">
        <div class="text-center" data-animate="fade-up">
          <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
            <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
            How It Works
          </span>
        </div>
        <h2 class="mt-4 text-center font-[Space_Grotesk] text-3xl font-bold tracking-tight sm:text-4xl text-gray-900 dark:text-white" data-animate="fade-up">
          Up and running in 3 steps
        </h2>

        <div class="mt-12 grid grid-cols-1 gap-12 lg:grid-cols-2">
          <div class="space-y-8">
            <div class="flex gap-4" data-animate="slide-left" data-delay="150">
              <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-indigo-600 text-sm font-bold text-white">1</div>
              <div>
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Define your agents</h3>
                <p class="mt-1 text-gray-500 dark:text-gray-400">Wrap existing agents with our lightweight SDK. Works with LangChain, CrewAI, AutoGen, and custom agents.</p>
              </div>
            </div>

            <div class="flex gap-4" data-animate="slide-left" data-delay="300">
              <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-indigo-600 text-sm font-bold text-white">2</div>
              <div>
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Build workflows</h3>
                <p class="mt-1 text-gray-500 dark:text-gray-400">Chain agents with our visual editor or Python DSL. Define dependencies, retries, and fallbacks.</p>
              </div>
            </div>

            <div class="flex gap-4" data-animate="slide-left" data-delay="450">
              <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-indigo-600 text-sm font-bold text-white">3</div>
              <div>
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Deploy & observe</h3>
                <p class="mt-1 text-gray-500 dark:text-gray-400">Push to production with one command. Get instant dashboards, alerts, and cost tracking.</p>
              </div>
            </div>
          </div>

          <div class="rounded-xl bg-gray-900 dark:bg-gray-800 p-6 ring-1 ring-gray-200 dark:ring-gray-700 hover-glow" data-animate="slide-right" data-delay="200">
            <div class="flex items-center gap-2 mb-4">
              <div class="h-3 w-3 rounded-full bg-red-500"></div>
              <div class="h-3 w-3 rounded-full bg-yellow-500"></div>
              <div class="h-3 w-3 rounded-full bg-green-500"></div>
              <span class="ml-2 text-sm text-gray-500">workflow.py</span>
            </div>
            <pre class="text-sm text-gray-300 overflow-x-auto"><code class="language-python">{raw(@code_snippet)}</code></pre>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
