defmodule AgentOrchLandingWeb.AboutLive do
  use AgentOrchLandingWeb, :live_view
  use AgentOrchLandingWeb.SharedEvents

  import AgentOrchLandingWeb.Landing.Navbar
  import AgentOrchLandingWeb.Landing.Footer

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:mobile_menu_open, false)
     |> assign(:theme, "dark")
     |> assign(:page_title, "About — AgentOrch")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="theme-root" phx-hook="ThemeToggle" class="min-h-screen bg-white dark:bg-gray-950 text-gray-900 dark:text-white" data-theme-value={@theme}>
      <.navbar mobile_menu_open={@mobile_menu_open} theme={@theme} />
      <div class="pt-16" id="scroll-reveal" phx-hook="ScrollReveal">
        <%!-- Hero --%>
        <section class="relative overflow-hidden px-6 py-32 sm:py-40 lg:px-8">
          <div class="absolute inset-0 bg-gradient-to-br from-indigo-100 via-white to-purple-100 dark:from-indigo-950 dark:via-gray-950 dark:to-purple-950"></div>
          <div class="relative mx-auto max-w-3xl text-center" data-animate="hero" data-delay="100">
            <h1 class="font-[Space_Grotesk] text-4xl font-bold tracking-tight sm:text-5xl bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 dark:from-indigo-400 dark:via-purple-400 dark:to-pink-400 bg-clip-text text-transparent">
              Building the future of AI agent orchestration
            </h1>
            <p class="mt-6 text-lg leading-8 text-gray-600 dark:text-gray-300">
              We believe AI agents are the next computing paradigm. AgentOrch gives teams the visibility and control they need to run agents confidently in production.
            </p>
          </div>
        </section>

        <%!-- Mission --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8">
          <div class="mx-auto max-w-5xl">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
              <div data-animate="slide-left">
                <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
                  <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
                  Our Mission
                </span>
                <h2 class="mt-4 font-[Space_Grotesk] text-3xl font-bold tracking-tight">
                  From agent chaos to agent clarity
                </h2>
                <p class="mt-4 text-gray-600 dark:text-gray-400 leading-7">
                  As AI agents proliferate across organizations, teams are flying blind — no visibility into what agents are doing, no coordination between them, and no control over costs or behavior.
                </p>
                <p class="mt-4 text-gray-600 dark:text-gray-400 leading-7">
                  AgentOrch is the orchestration layer that sits between your agents and your business. We provide the monitoring, coordination, and governance tools that make AI agents production-ready.
                </p>
              </div>
              <div class="grid grid-cols-2 gap-4" data-animate="slide-right">
                <div class="rounded-2xl bg-gradient-to-br from-indigo-500/10 to-purple-500/10 dark:from-indigo-500/5 dark:to-purple-500/5 p-6 ring-1 ring-indigo-500/10">
                  <div class="text-3xl font-bold text-indigo-600 dark:text-indigo-400">50K+</div>
                  <div class="mt-1 text-sm text-gray-600 dark:text-gray-400">Agents monitored</div>
                </div>
                <div class="rounded-2xl bg-gradient-to-br from-purple-500/10 to-pink-500/10 dark:from-purple-500/5 dark:to-pink-500/5 p-6 ring-1 ring-purple-500/10">
                  <div class="text-3xl font-bold text-purple-600 dark:text-purple-400">99.9%</div>
                  <div class="mt-1 text-sm text-gray-600 dark:text-gray-400">Uptime SLA</div>
                </div>
                <div class="rounded-2xl bg-gradient-to-br from-pink-500/10 to-rose-500/10 dark:from-pink-500/5 dark:to-rose-500/5 p-6 ring-1 ring-pink-500/10">
                  <div class="text-3xl font-bold text-pink-600 dark:text-pink-400">200+</div>
                  <div class="mt-1 text-sm text-gray-600 dark:text-gray-400">Teams onboarded</div>
                </div>
                <div class="rounded-2xl bg-gradient-to-br from-emerald-500/10 to-teal-500/10 dark:from-emerald-500/5 dark:to-teal-500/5 p-6 ring-1 ring-emerald-500/10">
                  <div class="text-3xl font-bold text-emerald-600 dark:text-emerald-400">40%</div>
                  <div class="mt-1 text-sm text-gray-600 dark:text-gray-400">Cost savings avg.</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <%!-- Values --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8 bg-gray-50 dark:bg-gray-900/50">
          <div class="mx-auto max-w-5xl">
            <div class="text-center" data-animate="fade-up">
              <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
                <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
                Our Values
              </span>
              <h2 class="mt-4 font-[Space_Grotesk] text-3xl font-bold tracking-tight">What drives us</h2>
            </div>
            <div class="mt-12 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="100">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-indigo-500/10 dark:bg-indigo-500/20">
                  <svg class="h-6 w-6 text-indigo-600 dark:text-indigo-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Transparency first</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  You should always know what your agents are doing, why they're doing it, and how much it costs. No black boxes.
                </p>
              </div>

              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="200">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-purple-500/10 dark:bg-purple-500/20">
                  <svg class="h-6 w-6 text-purple-600 dark:text-purple-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Reliability by design</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  We build for production from day one. Circuit breakers, fallbacks, and guardrails are not afterthoughts — they're the foundation.
                </p>
              </div>

              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="300">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-pink-500/10 dark:bg-pink-500/20">
                  <svg class="h-6 w-6 text-pink-600 dark:text-pink-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Builder empathy</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  We're engineers building for engineers. Every feature is designed to reduce friction, not add complexity.
                </p>
              </div>

              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="400">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-emerald-500/10 dark:bg-emerald-500/20">
                  <svg class="h-6 w-6 text-emerald-600 dark:text-emerald-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Speed matters</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  In the AI space, speed is a feature. We ship fast, iterate faster, and help our customers move at the speed of innovation.
                </p>
              </div>

              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="500">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-amber-500/10 dark:bg-amber-500/20">
                  <svg class="h-6 w-6 text-amber-600 dark:text-amber-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 18v-5.25m0 0a6.01 6.01 0 0 0 1.5-.189m-1.5.189a6.01 6.01 0 0 1-1.5-.189m3.75 7.478a12.06 12.06 0 0 1-4.5 0m3.75 2.383a14.406 14.406 0 0 1-3 0M14.25 18v-.192c0-.983.658-1.823 1.508-2.316a7.5 7.5 0 1 0-7.517 0c.85.493 1.509 1.333 1.509 2.316V18" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Opinionated simplicity</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  We make the complex simple by making smart defaults. Convention over configuration for the AI orchestration layer.
                </p>
              </div>

              <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm" data-animate="fade-up" data-delay="600">
                <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-cyan-500/10 dark:bg-cyan-500/20">
                  <svg class="h-6 w-6 text-cyan-600 dark:text-cyan-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.455 2.456L21.75 6l-1.036.259a3.375 3.375 0 0 0-2.455 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" />
                  </svg>
                </div>
                <h3 class="mt-4 text-lg font-semibold">Open ecosystem</h3>
                <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">
                  We integrate with every major AI framework and model provider. Your agents, your tools, our orchestration layer.
                </p>
              </div>
            </div>
          </div>
        </section>

        <%!-- Team --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8">
          <div class="mx-auto max-w-5xl">
            <div class="text-center" data-animate="fade-up">
              <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
                <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
                Our Team
              </span>
              <h2 class="mt-4 font-[Space_Grotesk] text-3xl font-bold tracking-tight">Meet the people behind AgentOrch</h2>
              <p class="mt-4 text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
                A team of engineers, researchers, and operators who've built and scaled AI systems at companies like Google, OpenAI, and Stripe.
              </p>
            </div>
            <div class="mt-12 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
              <.team_card
                name="Sarah Chen"
                role="Co-founder & CEO"
                bio="Former ML platform lead at Google. Built orchestration systems serving 1B+ requests/day."
                color="indigo"
              />
              <.team_card
                name="Marcus Johnson"
                role="Co-founder & CTO"
                bio="Ex-OpenAI infrastructure. Designed distributed agent runtimes for GPT-scale systems."
                color="purple"
              />
              <.team_card
                name="Priya Patel"
                role="Head of Product"
                bio="Former Stripe PM. Led developer tools used by 100K+ engineering teams worldwide."
                color="pink"
              />
              <.team_card
                name="Alex Rivera"
                role="Lead Engineer"
                bio="Ex-Datadog. Built real-time monitoring systems tracking millions of metrics per second."
                color="emerald"
              />
              <.team_card
                name="Yuki Tanaka"
                role="AI Research Lead"
                bio="PhD in multi-agent systems. Published 20+ papers on agent coordination and planning."
                color="amber"
              />
              <.team_card
                name="Jordan Lee"
                role="Head of Design"
                bio="Former Figma design lead. Passionate about making complex developer tools feel simple."
                color="cyan"
              />
            </div>
          </div>
        </section>

        <%!-- CTA --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8 bg-gray-50 dark:bg-gray-900/50">
          <div class="mx-auto max-w-2xl text-center" data-animate="fade-up">
            <h2 class="font-[Space_Grotesk] text-3xl font-bold tracking-tight bg-gradient-to-r from-indigo-600 to-purple-600 dark:from-indigo-400 dark:to-purple-400 bg-clip-text text-transparent">
              Want to join us?
            </h2>
            <p class="mt-6 text-gray-600 dark:text-gray-400">
              We're hiring across engineering, product, and design. Come build the orchestration layer for AI.
            </p>
            <div class="mt-8 flex flex-col sm:flex-row gap-4 justify-center">
              <a href="/#hero" class="rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 px-7 py-3 text-sm font-semibold text-white shadow-lg shadow-indigo-500/25 hover:shadow-indigo-500/40 hover:brightness-110 active:scale-[0.97] transition-all">
                Join the Waitlist →
              </a>
              <a href="/contact" class="rounded-full px-7 py-3 text-sm font-semibold text-gray-900 dark:text-white ring-1 ring-gray-300 dark:ring-gray-700 hover:bg-gray-100 dark:hover:bg-gray-800 transition-all">
                Get in Touch →
              </a>
            </div>
          </div>
        </section>
      </div>
      <.footer />
    </div>
    """
  end

  defp team_card(assigns) do
    colors = %{
      "indigo" => "from-indigo-500 to-indigo-600",
      "purple" => "from-purple-500 to-purple-600",
      "pink" => "from-pink-500 to-pink-600",
      "emerald" => "from-emerald-500 to-emerald-600",
      "amber" => "from-amber-500 to-amber-600",
      "cyan" => "from-cyan-500 to-cyan-600"
    }

    assigns = assign(assigns, :gradient, Map.get(colors, assigns.color, "from-indigo-500 to-indigo-600"))

    ~H"""
    <div class="rounded-2xl bg-white dark:bg-gray-800/50 p-6 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm hover:shadow-md transition-shadow" data-animate="fade-up">
      <div class={"flex h-14 w-14 items-center justify-center rounded-full bg-gradient-to-br #{@gradient} text-white text-lg font-bold shadow-lg"}>
        {String.first(@name)}
      </div>
      <h3 class="mt-4 text-base font-semibold">{@name}</h3>
      <p class="text-sm text-indigo-600 dark:text-indigo-400">{@role}</p>
      <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">{@bio}</p>
    </div>
    """
  end
end
