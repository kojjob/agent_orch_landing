defmodule AgentOrchLanding.BlogTest do
  use AgentOrchLanding.DataCase, async: true

  alias AgentOrchLanding.Blog

  @valid_attrs %{
    title: "Getting Started with AI Agents",
    slug: "getting-started-with-ai-agents",
    excerpt: "Learn the basics of AI agent orchestration.",
    body: "<p>AI agents are transforming how we build software.</p>",
    author: "Sarah Chen",
    published_at: ~U[2026-01-15 10:00:00Z]
  }

  @invalid_attrs %{title: nil, slug: nil, body: nil, author: nil}

  defp create_post(attrs \\ %{}) do
    {:ok, post} = Blog.create_post(Map.merge(@valid_attrs, attrs))
    post
  end

  describe "list_published_posts/0" do
    test "returns only published posts ordered by published_at desc" do
      older = create_post(%{slug: "older", published_at: ~U[2026-01-10 10:00:00Z]})
      newer = create_post(%{slug: "newer", published_at: ~U[2026-01-20 10:00:00Z]})

      posts = Blog.list_published_posts()
      assert length(posts) == 2
      assert hd(posts).id == newer.id
      assert List.last(posts).id == older.id
    end

    test "excludes drafts (published_at is nil)" do
      _draft = create_post(%{slug: "draft-post", published_at: nil})
      _published = create_post(%{slug: "published-post"})

      posts = Blog.list_published_posts()
      assert length(posts) == 1
      assert hd(posts).slug == "published-post"
    end
  end

  describe "get_post_by_slug!/1" do
    test "returns the post with the given slug" do
      post = create_post()
      found = Blog.get_post_by_slug!(post.slug)
      assert found.id == post.id
    end

    test "raises for unknown slug" do
      assert_raise Ecto.NoResultsError, fn ->
        Blog.get_post_by_slug!("nonexistent")
      end
    end
  end

  describe "create_post/1" do
    test "with valid data creates a post" do
      assert {:ok, post} = Blog.create_post(@valid_attrs)
      assert post.title == "Getting Started with AI Agents"
      assert post.slug == "getting-started-with-ai-agents"
      assert post.author == "Sarah Chen"
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "enforces unique slug" do
      create_post()
      assert {:error, changeset} = Blog.create_post(@valid_attrs)
      assert %{slug: ["has already been taken"]} = errors_on(changeset)
    end

    test "auto-generates slug from title when slug is blank" do
      attrs = Map.delete(@valid_attrs, :slug)
      assert {:ok, post} = Blog.create_post(attrs)
      assert post.slug == "getting-started-with-ai-agents"
    end
  end

  describe "change_post/2" do
    test "returns a changeset" do
      post = create_post()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
