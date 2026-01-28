defmodule AgentOrchLandingWeb.ContactLive do
  use AgentOrchLandingWeb, :live_view
  use AgentOrchLandingWeb.SharedEvents

  import AgentOrchLandingWeb.Landing.Navbar
  import AgentOrchLandingWeb.Landing.Footer

  alias AgentOrchLanding.Leads
  alias AgentOrchLanding.Leads.ContactSubmission

  @impl true
  def mount(_params, _session, socket) do
    changeset = Leads.change_contact_submission(%ContactSubmission{})

    {:ok,
     socket
     |> assign(:mobile_menu_open, false)
     |> assign(:theme, "dark")
     |> assign(:page_title, "Contact — AgentOrch")
     |> assign(:contact_form, to_form(changeset, as: "contact"))
     |> assign(:contact_submitted, false)}
  end

  def handle_event("validate_contact", %{"contact" => params}, socket) do
    changeset =
      %ContactSubmission{}
      |> ContactSubmission.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :contact_form, to_form(changeset, as: "contact"))}
  end

  def handle_event("submit_contact", %{"contact" => params}, socket) do
    case Leads.create_contact_submission(params) do
      {:ok, submission} ->
        AgentOrchLanding.Notifications.ContactNotifier.submission_received(submission)

        {:noreply,
         socket
         |> assign(:contact_submitted, true)
         |> put_flash(:info, "Message sent! We'll get back to you soon.")}

      {:error, changeset} ->
        {:noreply,
         assign(socket, :contact_form, to_form(changeset, as: "contact"))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="theme-root" phx-hook="ThemeToggle" class="min-h-screen bg-gray-50 dark:bg-gray-950 text-gray-900 dark:text-white" data-theme-value={@theme}>
      <.navbar mobile_menu_open={@mobile_menu_open} theme={@theme} />
      <div class="pt-16" id="scroll-reveal" phx-hook="ScrollReveal">
        <%!-- Hero --%>
        <section class="relative overflow-hidden px-6 py-32 sm:py-40 lg:px-8">
          <div class="absolute inset-0 bg-gradient-to-br from-purple-50 via-gray-50 to-indigo-50 dark:from-purple-950 dark:via-gray-950 dark:to-indigo-950"></div>
          <div class="relative mx-auto max-w-3xl text-center" data-animate="hero" data-delay="100">
            <h1 class="font-[Space_Grotesk] text-4xl font-bold tracking-tight sm:text-5xl bg-gradient-to-r from-purple-600 via-indigo-600 to-pink-600 dark:from-purple-400 dark:via-indigo-400 dark:to-pink-400 bg-clip-text text-transparent">
              Get in touch
            </h1>
            <p class="mt-6 text-lg leading-8 text-gray-600 dark:text-gray-300">
              Have questions about AgentOrch? Want to discuss a partnership? We'd love to hear from you.
            </p>
          </div>
        </section>

        <%!-- Contact Grid --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8">
          <div class="mx-auto max-w-6xl">
            <div class="grid grid-cols-1 lg:grid-cols-5 gap-16">
              <%!-- Contact Info --%>
              <div class="lg:col-span-2 space-y-8" data-animate="slide-left">
                <div>
                  <h2 class="font-[Space_Grotesk] text-2xl font-bold tracking-tight">Let's talk</h2>
                  <p class="mt-3 text-gray-600 dark:text-gray-400 leading-7">
                    Whether you're exploring AgentOrch for your team or just curious about AI agent orchestration, we're here to help.
                  </p>
                </div>

                <div class="space-y-6">
                  <%!-- Email --%>
                  <div class="flex items-start gap-4">
                    <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-indigo-500/10 dark:bg-indigo-500/20">
                      <svg class="h-5 w-5 text-indigo-600 dark:text-indigo-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
                      </svg>
                    </div>
                    <div>
                      <p class="font-medium">Email</p>
                      <a href="mailto:hello@agentorch.dev" class="text-sm text-indigo-600 dark:text-indigo-400 hover:underline">hello@agentorch.dev</a>
                    </div>
                  </div>

                  <%!-- Office --%>
                  <div class="flex items-start gap-4">
                    <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-purple-500/10 dark:bg-purple-500/20">
                      <svg class="h-5 w-5 text-purple-600 dark:text-purple-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                      </svg>
                    </div>
                    <div>
                      <p class="font-medium">Office</p>
                      <p class="text-sm text-gray-600 dark:text-gray-400">San Francisco, CA</p>
                      <p class="text-sm text-gray-500 dark:text-gray-500">548 Market St, Suite 36000</p>
                    </div>
                  </div>

                  <%!-- Phone --%>
                  <div class="flex items-start gap-4">
                    <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-pink-500/10 dark:bg-pink-500/20">
                      <svg class="h-5 w-5 text-pink-600 dark:text-pink-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z" />
                      </svg>
                    </div>
                    <div>
                      <p class="font-medium">Phone</p>
                      <a href="tel:+14155550123" class="text-sm text-gray-600 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors">+1 (415) 555-0123</a>
                    </div>
                  </div>

                  <%!-- Social --%>
                  <div class="flex items-start gap-4">
                    <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-emerald-500/10 dark:bg-emerald-500/20">
                      <svg class="h-5 w-5 text-emerald-600 dark:text-emerald-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 0 0 8.716-6.747M12 21a9.004 9.004 0 0 1-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 0 1 7.843 4.582M12 3a8.997 8.997 0 0 0-7.843 4.582m15.686 0A11.953 11.953 0 0 1 12 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0 1 21 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0 1 12 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 0 1 3 12c0-1.605.42-3.113 1.157-4.418" />
                      </svg>
                    </div>
                    <div>
                      <p class="font-medium">Social</p>
                      <div class="mt-1 flex gap-3">
                        <a href="https://github.com/agentorch" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="GitHub">
                          <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/></svg>
                        </a>
                        <a href="https://twitter.com/agentorch" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="Twitter">
                          <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
                        </a>
                        <a href="https://linkedin.com/company/agentorch" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="LinkedIn">
                          <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <%!-- Contact Form --%>
              <div class="lg:col-span-3" data-animate="slide-right">
                <div class="rounded-2xl bg-white/80 dark:bg-gray-800/50 p-8 ring-1 ring-gray-200 dark:ring-gray-700/50 shadow-sm">
                  <%= if @contact_submitted do %>
                    <div class="text-center py-12">
                      <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-green-100 dark:bg-green-900/30">
                        <svg class="h-7 w-7 text-green-600 dark:text-green-400" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                        </svg>
                      </div>
                      <h3 class="text-xl font-semibold">Message sent!</h3>
                      <p class="mt-2 text-gray-600 dark:text-gray-400">Thanks for reaching out. We'll get back to you within 24 hours.</p>
                    </div>
                  <% else %>
                    <h3 class="text-xl font-semibold mb-6">Send us a message</h3>
                    <.form for={@contact_form} phx-submit="submit_contact" phx-change="validate_contact" class="space-y-5">
                      <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                        <div>
                          <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Name</label>
                          <input
                            type="text"
                            name="contact[name]"
                            value={@contact_form[:name].value}
                            placeholder="Your name"
                            class={"w-full rounded-lg px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border text-gray-900 dark:text-white placeholder:text-gray-400 dark:placeholder:text-gray-500 focus:ring-2 focus:outline-none transition-all text-sm #{if @contact_form[:name].errors != [], do: "border-red-500 focus:border-red-500 focus:ring-red-500/20", else: "border-gray-300 dark:border-gray-700 focus:border-indigo-500 focus:ring-indigo-500/20"}"}
                          />
                          <.field_errors errors={@contact_form[:name].errors} />
                        </div>
                        <div>
                          <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Email</label>
                          <input
                            type="email"
                            name="contact[email]"
                            value={@contact_form[:email].value}
                            placeholder="you@company.com"
                            class={"w-full rounded-lg px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border text-gray-900 dark:text-white placeholder:text-gray-400 dark:placeholder:text-gray-500 focus:ring-2 focus:outline-none transition-all text-sm #{if @contact_form[:email].errors != [], do: "border-red-500 focus:border-red-500 focus:ring-red-500/20", else: "border-gray-300 dark:border-gray-700 focus:border-indigo-500 focus:ring-indigo-500/20"}"}
                          />
                          <.field_errors errors={@contact_form[:email].errors} />
                        </div>
                      </div>
                      <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Subject</label>
                        <select
                          name="contact[subject]"
                          class={"w-full rounded-lg px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border text-gray-900 dark:text-white focus:ring-2 focus:outline-none transition-all text-sm #{if @contact_form[:subject].errors != [], do: "border-red-500 focus:border-red-500 focus:ring-red-500/20", else: "border-gray-300 dark:border-gray-700 focus:border-indigo-500 focus:ring-indigo-500/20"}"}
                        >
                          <option value="">Select a topic...</option>
                          <option value="general" selected={@contact_form[:subject].value == "general"}>General Inquiry</option>
                          <option value="demo" selected={@contact_form[:subject].value == "demo"}>Request a Demo</option>
                          <option value="partnership" selected={@contact_form[:subject].value == "partnership"}>Partnership</option>
                          <option value="enterprise" selected={@contact_form[:subject].value == "enterprise"}>Enterprise Plan</option>
                          <option value="support" selected={@contact_form[:subject].value == "support"}>Technical Support</option>
                          <option value="press" selected={@contact_form[:subject].value == "press"}>Press & Media</option>
                        </select>
                        <.field_errors errors={@contact_form[:subject].errors} />
                      </div>
                      <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Message</label>
                        <textarea
                          name="contact[message]"
                          rows="5"
                          placeholder="Tell us how we can help..."
                          class={"w-full rounded-lg px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border text-gray-900 dark:text-white placeholder:text-gray-400 dark:placeholder:text-gray-500 focus:ring-2 focus:outline-none transition-all text-sm resize-none #{if @contact_form[:message].errors != [], do: "border-red-500 focus:border-red-500 focus:ring-red-500/20", else: "border-gray-300 dark:border-gray-700 focus:border-indigo-500 focus:ring-indigo-500/20"}"}
                        >{@contact_form[:message].value}</textarea>
                        <.field_errors errors={@contact_form[:message].errors} />
                      </div>
                      <button type="submit" class="w-full rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 px-7 py-3 text-sm font-semibold text-white shadow-lg shadow-indigo-500/25 hover:shadow-indigo-500/40 hover:brightness-110 active:scale-[0.97] transition-all">
                        Send Message →
                      </button>
                    </.form>
                  <% end %>
                </div>
              </div>
            </div>
          </div>
        </section>

        <%!-- FAQ --%>
        <section class="px-6 py-24 lg:py-32 lg:px-8 bg-gray-100/60 dark:bg-gray-900/50">
          <div class="mx-auto max-w-3xl">
            <div class="text-center" data-animate="fade-up">
              <span class="inline-flex items-center rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20">
                <span class="w-2 h-2 rounded-full bg-emerald-500 mr-2"></span>
                FAQ
              </span>
              <h2 class="mt-4 font-[Space_Grotesk] text-3xl font-bold tracking-tight">Frequently asked questions</h2>
            </div>
            <div class="mt-12 space-y-4">
              <.faq_item
                question="What AI frameworks do you support?"
                answer="AgentOrch integrates with LangChain, CrewAI, AutoGen, OpenAI Assistants, and any custom agent framework via our REST API and SDKs."
                delay="100"
              />
              <.faq_item
                question="How does pricing work?"
                answer="We offer a free tier for up to 5 agents with basic monitoring. Pro and Enterprise plans scale based on the number of agents and features you need."
                delay="200"
              />
              <.faq_item
                question="Can I try AgentOrch before committing?"
                answer="Join our waitlist for early access. Design partners get free Pro access and direct input on the roadmap."
                delay="300"
              />
              <.faq_item
                question="Is my data secure?"
                answer="AgentOrch is SOC 2 Type II compliant. All data is encrypted at rest and in transit. We never train on your data or share it with third parties."
                delay="400"
              />
              <.faq_item
                question="Do you offer on-premise deployment?"
                answer="Yes, our Enterprise plan includes on-premise and VPC deployment options with dedicated support and custom SLAs."
                delay="500"
              />
            </div>
          </div>
        </section>
      </div>
      <.footer />
    </div>
    """
  end

  defp field_errors(assigns) do
    ~H"""
    <%= for {msg, _opts} <- @errors do %>
      <p class="mt-1 text-xs text-red-600 dark:text-red-400"><%= msg %></p>
    <% end %>
    """
  end

  defp faq_item(assigns) do
    ~H"""
    <div class="rounded-2xl bg-white/80 dark:bg-gray-800/50 p-6 ring-1 ring-gray-200 dark:ring-gray-700/50" data-animate="fade-up" data-delay={@delay}>
      <h3 class="text-base font-semibold">{@question}</h3>
      <p class="mt-2 text-sm text-gray-600 dark:text-gray-400 leading-6">{@answer}</p>
    </div>
    """
  end
end
