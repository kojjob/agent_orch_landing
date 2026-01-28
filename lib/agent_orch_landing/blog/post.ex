defmodule AgentOrchLanding.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "blog_posts" do
    field :title, :string
    field :slug, :string
    field :excerpt, :string
    field :body, :string
    field :author, :string
    field :published_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :excerpt, :body, :author, :published_at])
    |> validate_required([:title, :body, :author])
    |> maybe_generate_slug()
    |> validate_required([:slug])
    |> unique_constraint(:slug)
  end

  defp maybe_generate_slug(changeset) do
    case get_field(changeset, :slug) do
      nil -> put_change(changeset, :slug, slugify(get_field(changeset, :title)))
      "" -> put_change(changeset, :slug, slugify(get_field(changeset, :title)))
      _ -> changeset
    end
  end

  defp slugify(nil), do: nil

  defp slugify(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s-]/, "")
    |> String.replace(~r/[\s]+/, "-")
    |> String.trim("-")
  end
end
