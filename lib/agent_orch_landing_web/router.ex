defmodule AgentOrchLandingWeb.Router do
  use AgentOrchLandingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {AgentOrchLandingWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_variant
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AgentOrchLandingWeb do
    pipe_through :browser

    live "/", LandingLive, :index
    live "/about", AboutLive, :index
    live "/contact", ContactLive, :index
    live "/blog", BlogLive, :index
    live "/blog/:slug", BlogPostLive, :show
  end

  if Application.compile_env(:agent_orch_landing, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AgentOrchLandingWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  defp assign_variant(conn, _opts) do
    variants = ~w(v1 v2 v3 v4)

    variant =
      conn.params["variant"] ||
        get_session(conn, :variant) ||
        Enum.random(variants)

    conn
    |> put_session(:variant, variant)
    |> assign(:variant, variant)
  end
end
