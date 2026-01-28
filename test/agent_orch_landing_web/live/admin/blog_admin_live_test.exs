defmodule AgentOrchLandingWeb.Admin.BlogAdminLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias AgentOrchLanding.Blog

  @post_attrs %{
    title: "Test Post",
    slug: "test-post",
    excerpt: "Test excerpt",
    body: "# Hello\n\nThis is **markdown**.",
    author: "Admin",
    published_at: ~U[2026-01-15 10:00:00Z]
  }

  defp authed_conn(%{conn: conn}) do
    credentials = Base.encode64("admin:admin")

    conn =
      conn
      |> put_req_header("authorization", "Basic #{credentials}")

    %{conn: conn}
  end

  defp create_post(_context \\ %{}) do
    {:ok, post} = Blog.create_post(@post_attrs)
    %{post: post}
  end

  describe "unauthenticated access" do
    test "returns 401 for /admin/blog", %{conn: conn} do
      conn = get(conn, "/admin/blog")
      assert conn.status == 401
    end
  end

  describe "admin blog index" do
    setup [:authed_conn]

    test "lists all posts including drafts", %{conn: conn} do
      {:ok, _} = Blog.create_post(@post_attrs)

      {:ok, _} =
        Blog.create_post(%{@post_attrs | slug: "draft-post", title: "Draft", published_at: nil})

      {:ok, _view, html} = live(conn, "/admin/blog")
      assert html =~ "Test Post"
      assert html =~ "Draft"
    end

    test "shows published/draft badge", %{conn: conn} do
      {:ok, _} = Blog.create_post(@post_attrs)

      {:ok, _} =
        Blog.create_post(%{@post_attrs | slug: "draft-post", title: "Draft", published_at: nil})

      {:ok, _view, html} = live(conn, "/admin/blog")
      assert html =~ "Published"
      assert html =~ "Draft"
    end

    test "can delete a post", %{conn: conn} do
      %{post: post} = create_post()

      {:ok, view, _html} = live(conn, "/admin/blog")

      html =
        view
        |> element(~s{a[phx-click="delete"][phx-value-id="#{post.id}"]})
        |> render_click()

      refute html =~ "Test Post"
    end
  end

  describe "admin blog form - new" do
    setup [:authed_conn]

    test "renders new post form", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/admin/blog/new")
      assert html =~ "New Post"
    end

    test "creates a post with valid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/admin/blog/new")

      view
      |> form("#post-form",
        post: %{
          title: "New Post",
          body: "# Content",
          author: "Admin",
          excerpt: "Excerpt"
        }
      )
      |> render_submit()

      # Should redirect to index
      assert_redirect(view, "/admin/blog")
    end

    test "shows errors with invalid data", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/admin/blog/new")

      html =
        view
        |> form("#post-form", post: %{title: "", body: "", author: ""})
        |> render_submit()

      assert html =~ "can&#39;t be blank" or html =~ "can&apos;t be blank"
    end
  end

  describe "admin blog form - edit" do
    setup [:authed_conn]

    test "renders edit form with existing data", %{conn: conn} do
      %{post: post} = create_post()

      {:ok, _view, html} = live(conn, "/admin/blog/#{post.id}/edit")
      assert html =~ "Edit Post"
      assert html =~ "Test Post"
    end

    test "updates a post with valid data", %{conn: conn} do
      %{post: post} = create_post()

      {:ok, view, _html} = live(conn, "/admin/blog/#{post.id}/edit")

      view
      |> form("#post-form", post: %{title: "Updated Title"})
      |> render_submit()

      assert_redirect(view, "/admin/blog")
    end
  end

  describe "admin blog form - uploads" do
    setup [:authed_conn]

    test "renders featured image upload zone on new form", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/admin/blog/new")
      assert html =~ "Upload a featured image"
      assert html =~ "Upload Inline Image"
    end

    test "shows existing featured image in edit form", %{conn: conn} do
      {:ok, post} =
        Blog.create_post(
          Map.put(@post_attrs, :featured_image, "/uploads/test.jpg")
          |> Map.put(:slug, "image-post")
        )

      {:ok, _view, html} = live(conn, "/admin/blog/#{post.id}/edit")
      assert html =~ "/uploads/test.jpg"
      assert html =~ "Remove image"
    end
  end

  describe "markdown preview" do
    setup [:authed_conn]

    test "shows live markdown preview", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/admin/blog/new")

      html =
        view
        |> form("#post-form", post: %{body: "# Hello World"})
        |> render_change()

      assert html =~ "<h1>"
      assert html =~ "Hello World"
    end
  end
end
