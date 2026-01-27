defmodule AgentOrchLandingWeb.Landing.CtaSection do
  use Phoenix.Component
  import AgentOrchLandingWeb.CoreComponents

  attr :form, :any, required: true
  attr :submitted, :boolean, default: false
  attr :show_partner_modal, :boolean, default: false
  attr :partner_form, :any, required: true
  attr :partner_submitted, :boolean, default: false

  def cta_section(assigns) do
    ~H"""
    <section class="px-6 py-24 lg:px-8">
      <div class="mx-auto max-w-2xl text-center">
        <h2 class="text-3xl font-bold tracking-tight sm:text-4xl bg-gradient-to-r from-indigo-400 to-purple-400 bg-clip-text text-transparent">
          Ready to take control of your agents?
        </h2>
        <p class="mt-4 text-lg text-gray-400">
          Join the waitlist for early access. Or become a design partner and shape the product.
        </p>

        <div class="mt-8">
          <%= if @submitted do %>
            <p class="text-green-400 font-semibold">You're on the waitlist! We'll be in touch.</p>
          <% else %>
            <.form for={@form} phx-submit="submit_cta_email" class="flex flex-col sm:flex-row gap-3 justify-center max-w-md mx-auto">
              <div class="flex-1">
                <.input
                  field={@form[:email]}
                  type="email"
                  placeholder="you@company.com"
                  required
                  class="!bg-gray-800 !border-gray-700 !text-white placeholder:text-gray-500"
                />
              </div>
              <button type="submit" class="rounded-lg bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors whitespace-nowrap">
                Join Waitlist
              </button>
            </.form>
          <% end %>
        </div>

        <div class="mt-6">
          <button
            phx-click="open_partner_modal"
            class="text-sm text-indigo-400 hover:text-indigo-300 underline underline-offset-4 transition-colors"
          >
            Become a Design Partner →
          </button>
        </div>
      </div>

      <%= if @show_partner_modal do %>
        <div class="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm" phx-click="close_partner_modal">
          <div class="w-full max-w-lg rounded-2xl bg-gray-900 p-8 ring-1 ring-gray-700 shadow-2xl" phx-click-away="close_partner_modal">
            <div class="flex items-center justify-between mb-6">
              <h3 class="text-xl font-bold text-white">Become a Design Partner</h3>
              <button phx-click="close_partner_modal" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
            <p class="text-sm text-gray-400 mb-6">
              Design partners get free Pro access, direct input on the roadmap, and white-glove onboarding.
            </p>

            <.form for={@partner_form} phx-submit="submit_partner" phx-change="validate_partner" class="space-y-4">
              <.input field={@partner_form[:email]} type="email" label="Work email" required />
              <.input field={@partner_form[:company]} type="text" label="Company" required />
              <.input
                field={@partner_form[:agent_count]}
                type="select"
                label="How many agents do you run?"
                options={[
                  {"Select...", ""},
                  {"1-5", "1-5"},
                  {"6-20", "6-20"},
                  {"21-50", "21-50"},
                  {"50+", "50+"}
                ]}
                required
              />
              <.input field={@partner_form[:pain_point]} type="textarea" label="Biggest pain point with agents?" required />

              <button type="submit" class="w-full rounded-lg bg-indigo-600 px-6 py-3 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors">
                Apply as Design Partner
              </button>
            </.form>
          </div>
        </div>
      <% end %>
    </section>
    """
  end
end
