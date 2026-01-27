defmodule AgentOrchLandingWeb.LandingLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias AgentOrchLanding.Leads

  describe "landing page" do
    test "renders with default headline", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      # Should render one of the 4 headlines
      assert html =~ "AI Agent" || html =~ "Agent"
    end

    test "renders with v2 variant from URL param", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/?variant=v2")
      assert html =~ "Your AI Agents Deserve a Control Tower"
    end

    test "renders with v3 variant from URL param", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/?variant=v3")
      assert html =~ "Orchestrate AI Agents Like a Symphony"
    end

    test "renders all sections", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "Running AI agents in production is painful"
      assert html =~ "Three pillars"
      assert html =~ "Up and running in 3 steps"
      assert html =~ "Built for teams"
      assert html =~ "Simple pricing"
      assert html =~ "Ready to take control"
    end
  end

  describe "email capture" do
    test "submits email successfully", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      view
      |> form("form[phx-submit='submit_email']", %{email_capture: %{email: "test@example.com"}})
      |> render_submit()

      assert render(view) =~ "on the waitlist"
      assert Leads.get_email_capture_by_email("test@example.com")
    end

    test "shows validation error for invalid email", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      html =
        view
        |> form("form[phx-submit='submit_email']", %{email_capture: %{email: "bad"}})
        |> render_submit()

      assert html =~ "must be a valid email"
    end

    test "shows error for duplicate email", %{conn: conn} do
      {:ok, _} = Leads.create_email_capture(%{email: "dupe@example.com"})
      {:ok, view, _html} = live(conn, "/")

      html =
        view
        |> form("form[phx-submit='submit_email']", %{email_capture: %{email: "dupe@example.com"}})
        |> render_submit()

      assert html =~ "has already been registered"
    end
  end

  describe "design partner modal" do
    test "opens and closes modal", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      refute render(view) =~ "Become a Design Partner</h3>"

      html = view |> element("button", "Become a Design Partner") |> render_click()
      assert html =~ "Become a Design Partner</h3>"

      html = view |> element("button[phx-click='close_partner_modal']") |> render_click()
      refute html =~ "Become a Design Partner</h3>"
    end

    test "submits design partner form", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      view |> element("button", "Become a Design Partner") |> render_click()

      view
      |> form("form[phx-submit='submit_partner']", %{
        design_partner: %{
          email: "partner@co.com",
          company: "TestCo",
          agent_count: "6-20",
          pain_point: "Agents fail silently"
        }
      })
      |> render_submit()

      assert Leads.get_design_partner_by_email("partner@co.com")
    end
  end
end
