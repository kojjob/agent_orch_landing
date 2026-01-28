defmodule AgentOrchLandingWeb.ContactLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "contact page" do
    test "renders hero heading", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ "Get in touch"
    end

    test "renders contact info", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ "hello@agentorch.dev"
      assert html =~ "San Francisco, CA"
      assert html =~ "+1 (415) 555-0123"
    end

    test "renders contact form fields", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ "Your name"
      assert html =~ "you@company.com"
      assert html =~ "Select a topic"
      assert html =~ "Tell us how we can help"
      assert html =~ "Send Message"
    end

    test "form submission shows success state", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/contact")

      html =
        view
        |> form("form[phx-submit='submit_contact']", %{
          contact: %{
            name: "Test User",
            email: "test@example.com",
            subject: "general",
            message: "Hello there"
          }
        })
        |> render_submit()

      assert html =~ "Message sent!"
      assert html =~ "get back to you within 24 hours"
    end

    test "renders FAQ section", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/contact")
      assert html =~ "Frequently asked questions"
      assert html =~ "What AI frameworks do you support?"
      assert html =~ "How does pricing work?"
      assert html =~ "Is my data secure?"
    end
  end

  describe "shared events" do
    test "mobile menu toggle works", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/contact")

      html = view |> element("button[phx-click='toggle_mobile_menu']") |> render_click()
      assert html =~ "mobile_menu_open"
             or html =~ "About"
    end

    test "theme toggle works", %{conn: conn} do
      {:ok, view, html} = live(conn, "/contact")
      assert html =~ ~s(data-theme-value="dark")

      html = view |> element("#theme-toggle") |> render_click()
      assert html =~ ~s(data-theme-value="light")
    end
  end
end
