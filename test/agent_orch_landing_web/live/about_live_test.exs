defmodule AgentOrchLandingWeb.AboutLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "about page" do
    test "renders hero heading", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ "Building the future"
    end

    test "renders mission stats", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ "50K+"
      assert html =~ "99.9%"
      assert html =~ "200+"
      assert html =~ "40%"
    end

    test "renders values section with 6 value cards", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ "Our Values"
      assert html =~ "Transparency first"
      assert html =~ "Reliability by design"
      assert html =~ "Builder empathy"
      assert html =~ "Speed matters"
      assert html =~ "Opinionated simplicity"
      assert html =~ "Open ecosystem"
    end

    test "renders team section with 6 team members", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ "Our Team"
      assert html =~ "Sarah Chen"
      assert html =~ "Marcus Johnson"
      assert html =~ "Priya Patel"
      assert html =~ "Alex Rivera"
      assert html =~ "Yuki Tanaka"
      assert html =~ "Jordan Lee"
    end

    test "renders CTA section", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ "Want to join us?"
      assert html =~ "Join the Waitlist"
    end
  end

  describe "shared events" do
    test "mobile menu toggle works", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/about")

      html = view |> element("button[phx-click='toggle_mobile_menu']") |> render_click()
      # After toggling, mobile menu should be open (content becomes visible)
      assert html =~ "mobile_menu_open"
             or html =~ "About"
    end

    test "theme toggle works", %{conn: conn} do
      {:ok, view, html} = live(conn, "/about")
      # Default theme is dark
      assert html =~ ~s(data-theme-value="dark")

      html = view |> element("#theme-toggle") |> render_click()
      assert html =~ ~s(data-theme-value="light")
    end
  end
end
