defmodule AgentOrchLandingWeb.LandingLive do
  use AgentOrchLandingWeb, :live_view

  alias AgentOrchLanding.Leads
  alias AgentOrchLanding.Leads.{EmailCapture, DesignPartner}

  import AgentOrchLandingWeb.Landing.HeroSection
  import AgentOrchLandingWeb.Landing.ProblemSection
  import AgentOrchLandingWeb.Landing.SolutionSection
  import AgentOrchLandingWeb.Landing.HowItWorksSection
  import AgentOrchLandingWeb.Landing.SocialProofSection
  import AgentOrchLandingWeb.Landing.PricingSection
  import AgentOrchLandingWeb.Landing.CtaSection
  import AgentOrchLandingWeb.Landing.Navbar
  import AgentOrchLandingWeb.Landing.Footer

  @headlines %{
    "v1" => "Stop Flying Blind with Your AI Agents",
    "v2" => "Your AI Agents Deserve a Control Tower",
    "v3" => "Orchestrate AI Agents Like a Symphony",
    "v4" => "From Agent Chaos to Agent Clarity"
  }

  @impl true
  def mount(_params, session, socket) do
    variant = session["variant"] || "v1"
    headline = Map.get(@headlines, variant, @headlines["v1"])

    {:ok,
     socket
     |> assign(:variant, variant)
     |> assign(:headline, headline)
     |> assign(:email_form, to_form(Leads.change_email_capture(%EmailCapture{}), id: "hero_email"))
     |> assign(:cta_email_form, to_form(Leads.change_email_capture(%EmailCapture{}), id: "cta_email"))
     |> assign(:partner_form, to_form(Leads.change_design_partner(%DesignPartner{})))
     |> assign(:show_partner_modal, false)
     |> assign(:email_submitted, false)
     |> assign(:partner_submitted, false)
     |> assign(:mobile_menu_open, false)
     |> assign(:theme, "dark")
     |> assign(:page_title, "AgentOrch — AI Agent Orchestration Platform")}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    variant = params["variant"] || socket.assigns.variant
    headline = Map.get(@headlines, variant, @headlines["v1"])

    {:noreply,
     socket
     |> assign(:variant, variant)
     |> assign(:headline, headline)}
  end

  @impl true
  def handle_event("submit_email", %{"email_capture" => params}, socket) do
    params = Map.merge(params, %{"source" => "hero", "variant" => socket.assigns.variant})

    case Leads.create_email_capture(params) do
      {:ok, _capture} ->
        {:noreply,
         socket
         |> assign(:email_submitted, true)
         |> assign(:email_form, to_form(Leads.change_email_capture(%EmailCapture{}), id: "hero_email"))
         |> put_flash(:info, "You're on the list!")}

      {:error, changeset} ->
        {:noreply, assign(socket, :email_form, to_form(changeset, id: "hero_email"))}
    end
  end

  def handle_event("submit_cta_email", %{"email_capture" => params}, socket) do
    params = Map.merge(params, %{"source" => "cta", "variant" => socket.assigns.variant})

    case Leads.create_email_capture(params) do
      {:ok, _capture} ->
        {:noreply,
         socket
         |> assign(:email_submitted, true)
         |> put_flash(:info, "You're on the list!")}

      {:error, changeset} ->
        {:noreply, assign(socket, :cta_email_form, to_form(changeset, id: "cta_email"))}
    end
  end

  def handle_event("open_partner_modal", _params, socket) do
    {:noreply, assign(socket, :show_partner_modal, true)}
  end

  def handle_event("close_partner_modal", _params, socket) do
    {:noreply, assign(socket, :show_partner_modal, false)}
  end

  def handle_event("submit_partner", %{"design_partner" => params}, socket) do
    case Leads.create_design_partner(params) do
      {:ok, _partner} ->
        {:noreply,
         socket
         |> assign(:partner_submitted, true)}

      {:error, changeset} ->
        {:noreply, assign(socket, :partner_form, to_form(changeset))}
    end
  end

  def handle_event("validate_email", %{"email_capture" => params}, socket) do
    changeset =
      %EmailCapture{}
      |> EmailCapture.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :email_form, to_form(changeset, id: "hero_email"))}
  end

  def handle_event("toggle_mobile_menu", _params, socket) do
    {:noreply, assign(socket, :mobile_menu_open, !socket.assigns.mobile_menu_open)}
  end

  def handle_event("toggle_theme", _params, socket) do
    new_theme = if socket.assigns.theme == "dark", do: "light", else: "dark"
    {:noreply, assign(socket, :theme, new_theme)}
  end

  def handle_event("set_theme", %{"theme" => theme}, socket) when theme in ["dark", "light"] do
    {:noreply, assign(socket, :theme, theme)}
  end

  def handle_event("validate_partner", %{"design_partner" => params}, socket) do
    changeset =
      %DesignPartner{}
      |> DesignPartner.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :partner_form, to_form(changeset))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="theme-root" phx-hook="ThemeToggle" class="min-h-screen bg-white dark:bg-gray-950 text-gray-900 dark:text-white" data-theme-value={@theme}>
      <.navbar mobile_menu_open={@mobile_menu_open} theme={@theme} />
      <div class="pt-16" id="scroll-reveal" phx-hook="ScrollReveal">
        <.hero_section headline={@headline} form={@email_form} submitted={@email_submitted} />
        <.problem_section />
        <.solution_section />
        <.how_it_works_section />
        <.social_proof_section />
        <.pricing_section />
        <.cta_section
          form={@cta_email_form}
          submitted={@email_submitted}
          show_partner_modal={@show_partner_modal}
          partner_form={@partner_form}
          partner_submitted={@partner_submitted}
        />
      </div>
      <.footer />
    </div>
    """
  end
end
