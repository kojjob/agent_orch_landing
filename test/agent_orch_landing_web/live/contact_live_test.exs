defmodule AgentOrchLandingWeb.ContactLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Swoosh.TestAssertions

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

    test "form submission persists data and shows success state", %{conn: conn} do
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

      # Verify data was persisted
      sub = AgentOrchLanding.Leads.list_contact_submissions() |> List.first()
      assert sub.name == "Test User"
      assert sub.email == "test@example.com"
      assert sub.subject == "general"
      assert sub.message == "Hello there"

      # Verify notification email was sent
      assert_received {:email, %Swoosh.Email{subject: "New contact submission from Test User"}}
    end

    test "shows validation errors on change with invalid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/contact")

      html =
        view
        |> form("form[phx-submit='submit_contact']", %{
          contact: %{name: "", email: "bad", subject: "", message: ""}
        })
        |> render_change()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
      assert html =~ "must be a valid email"
    end

    test "clears validation errors when fields become valid", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/contact")

      # Trigger errors first
      view
      |> form("form[phx-submit='submit_contact']", %{
        contact: %{name: "", email: "bad", subject: "", message: ""}
      })
      |> render_change()

      # Fix the fields
      html =
        view
        |> form("form[phx-submit='submit_contact']", %{
          contact: %{name: "Valid", email: "valid@test.com", subject: "general", message: "Hello"}
        })
        |> render_change()

      refute html =~ "can&#39;t be blank" or html =~ "can't be blank"
      refute html =~ "must be a valid email"
    end

    test "submit with invalid data shows errors instead of success", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/contact")

      html =
        view
        |> form("form[phx-submit='submit_contact']", %{
          contact: %{name: "", email: "", subject: "", message: ""}
        })
        |> render_submit()

      refute html =~ "Message sent!"
      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
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
