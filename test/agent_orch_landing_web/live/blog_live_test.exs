defmodule AgentOrchLandingWeb.BlogLiveTest do
  use AgentOrchLandingWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias AgentOrchLanding.Blog

  @post_attrs %{
    title: "First Blog Post",
    slug: "first-blog-post",
    excerpt: "This is the first post excerpt.",
    body: "<p>Full body of the first blog post.</p>",
    author: "Sarah Chen",
    published_at: ~U[2026-01-15 10:00:00Z]
  }

  describe "blog index" do
    test "renders heading and post titles", %{conn: conn} do
      {:ok, _post} = Blog.create_post(@post_attrs)

      {:ok, _view, html} = live(conn, "/blog")
      assert html =~ "Blog"
      assert html =~ "First Blog Post"
      assert html =~ "This is the first post excerpt."
    end

    test "shows empty state when no posts", %{conn: conn} do
      {:ok, _view, html} = live(conn, "/blog")
      assert html =~ "No posts yet"
    end

    test "excludes draft posts", %{conn: conn} do
      {:ok, _} = Blog.create_post(Map.put(@post_attrs, :published_at, nil))

      {:ok, _view, html} = live(conn, "/blog")
      refute html =~ "First Blog Post"
      assert html =~ "No posts yet"
    end
  end

  describe "blog detail" do
    test "renders post title, author, and body", %{conn: conn} do
      {:ok, _post} = Blog.create_post(@post_attrs)

      {:ok, _view, html} = live(conn, "/blog/first-blog-post")
      assert html =~ "First Blog Post"
      assert html =~ "Sarah Chen"
      assert html =~ "Full body of the first blog post."
    end

    test "returns error for unknown slug", %{conn: conn} do
      assert_raise Ecto.NoResultsError, fn ->
        live(conn, "/blog/nonexistent-slug")
      end
    end

    test "renders markdown body as HTML", %{conn: conn} do
      {:ok, _} =
        Blog.create_post(%{
          @post_attrs
          | slug: "markdown-post",
            body: "# Hello\n\nThis is **bold** text."
        })

      {:ok, _view, html} = live(conn, "/blog/markdown-post")
      assert html =~ "<h1>"
      assert html =~ "Hello"
      assert html =~ "<strong>bold</strong>"
    end
  end
end
