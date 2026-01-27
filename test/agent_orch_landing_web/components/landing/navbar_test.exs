defmodule AgentOrchLandingWeb.Landing.NavbarTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "navbar rendering" do
    test "renders navbar with logo", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "AgentOrch"
      assert html =~ ~s(id="navbar")
    end

    test "renders navigation links", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "Features"
      assert html =~ "How It Works"
      assert html =~ "Pricing"
    end

    test "renders anchor links to sections", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(href="#solution")
      assert html =~ ~s(href="#how-it-works")
      assert html =~ ~s(href="#pricing")
    end

    test "renders Join Waitlist CTA in navbar", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      # Navbar should have a waitlist CTA link
      assert html =~ "Join Waitlist"
    end

    test "renders mobile menu button", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "toggle_mobile_menu"
    end

    test "mobile menu toggles on click", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")

      # Click the mobile menu button
      html = view |> element("button[phx-click='toggle_mobile_menu']") |> render_click()
      assert html =~ ~s(id="mobile-menu")
    end

    test "renders theme toggle button", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "toggle_theme"
      assert html =~ ~s(id="theme-toggle")
    end

    test "theme toggle switches theme", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      html = view |> element("#theme-toggle") |> render_click()
      # After toggle, the theme should be "light"
      assert html =~ ~s(data-theme-value="light")
    end
  end
end
