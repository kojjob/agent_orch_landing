defmodule AgentOrchLandingWeb.Landing.FooterTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "footer rendering" do
    test "renders footer with brand info", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(id="footer")
      assert html =~ "AgentOrch"
    end

    test "renders product links", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "Features"
      assert html =~ "Pricing"
      assert html =~ "Roadmap"
      assert html =~ "Changelog"
    end

    test "renders company links", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "About"
      assert html =~ "Blog"
      assert html =~ "Careers"
      assert html =~ "Contact"
    end

    test "renders legal links", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "Privacy Policy"
      assert html =~ "Terms of Service"
      assert html =~ "Cookie Policy"
    end

    test "renders copyright notice", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ "© 2026 AgentOrch"
      assert html =~ "Elixir"
    end
  end
end
