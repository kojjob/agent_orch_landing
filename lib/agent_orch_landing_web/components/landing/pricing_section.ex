defmodule AgentOrchLandingWeb.Landing.PricingSection do
  use Phoenix.Component

  def pricing_section(assigns) do
    ~H"""
    <section id="pricing" class="px-6 py-20 lg:px-8 bg-gray-900/50">
      <div class="mx-auto max-w-5xl">
        <h2 class="text-center text-3xl font-bold tracking-tight sm:text-4xl text-white">
          Simple pricing, no surprises
        </h2>
        <p class="mt-4 text-center text-gray-400 text-lg">
          Start free. Scale when you're ready.
        </p>

        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-3">
          <div class="rounded-xl bg-gray-800/50 p-8 ring-1 ring-gray-700/50">
            <h3 class="text-lg font-semibold text-white">Free</h3>
            <p class="mt-2 text-4xl font-bold text-white">$0</p>
            <p class="text-sm text-gray-500">forever</p>
            <ul class="mt-6 space-y-3 text-sm text-gray-300">
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Up to 3 agents</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Basic dashboard</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> 1K executions/mo</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Community support</li>
            </ul>
          </div>

          <div class="rounded-xl bg-gray-800/50 p-8 ring-2 ring-indigo-500">
            <div class="flex items-center justify-between">
              <h3 class="text-lg font-semibold text-white">Pro</h3>
              <span class="rounded-full bg-indigo-600 px-3 py-1 text-xs font-semibold">Popular</span>
            </div>
            <p class="mt-2 text-4xl font-bold text-white">$99</p>
            <p class="text-sm text-gray-500">/month</p>
            <ul class="mt-6 space-y-3 text-sm text-gray-300">
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Unlimited agents</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Advanced observability</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> 50K executions/mo</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Priority support</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Cost controls</li>
            </ul>
          </div>

          <div class="rounded-xl bg-gray-800/50 p-8 ring-1 ring-gray-700/50">
            <h3 class="text-lg font-semibold text-white">Enterprise</h3>
            <p class="mt-2 text-4xl font-bold text-white">Custom</p>
            <p class="text-sm text-gray-500">talk to us</p>
            <ul class="mt-6 space-y-3 text-sm text-gray-300">
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Everything in Pro</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Self-hosted option</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Unlimited executions</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> Dedicated support</li>
              <li class="flex gap-2"><span class="text-green-400">&#10003;</span> SLA guarantees</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
