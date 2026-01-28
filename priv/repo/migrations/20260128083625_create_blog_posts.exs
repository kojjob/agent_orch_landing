defmodule AgentOrchLanding.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :slug, :string, null: false
      add :excerpt, :string, size: 500
      add :body, :text
      add :author, :string, null: false
      add :published_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:blog_posts, [:slug])
  end
end
