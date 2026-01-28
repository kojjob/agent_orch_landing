defmodule AgentOrchLanding.Blog do
  import Ecto.Query
  alias AgentOrchLanding.Repo
  alias AgentOrchLanding.Blog.Post

  def list_all_posts do
    Post
    |> order_by([p], desc: p.inserted_at)
    |> Repo.all()
  end

  def get_post!(id) do
    Repo.get!(Post, id)
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def list_published_posts do
    Post
    |> where([p], not is_nil(p.published_at))
    |> order_by([p], desc: p.published_at)
    |> Repo.all()
  end

  def get_post_by_slug!(slug) do
    Repo.get_by!(Post, slug: slug)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
