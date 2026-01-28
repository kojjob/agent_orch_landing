defmodule AgentOrchLandingWeb.SeoMetaTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "landing page meta tags" do
    test "renders page-specific meta description", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(name="description" content="AgentOrch)
    end

    test "renders page-specific og:title", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(property="og:title" content="AgentOrch)
    end

    test "renders page-specific og:description", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(property="og:description")
    end

    test "renders twitter:card meta", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/")
      assert html =~ ~s(name="twitter:card" content="summary_large_image")
    end
  end

  describe "about page meta tags" do
    test "renders about-specific meta description", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ ~s(name="description" content="Learn about the team)
    end

    test "renders about-specific og:title", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/about")
      assert html =~ ~s(property="og:title" content="About — AgentOrch")
    end
  end

  describe "contact page meta tags" do
    test "renders contact-specific meta description", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ ~s(name="description" content="Get in touch)
    end

    test "renders contact-specific og:title", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ ~s(property="og:title" content="Contact — AgentOrch")
    end
  end
end
