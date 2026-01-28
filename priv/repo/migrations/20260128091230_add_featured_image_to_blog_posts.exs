defmodule AgentOrchLanding.Repo.Migrations.AddFeaturedImageToBlogPosts do
  use Ecto.Migration

  def change do
    alter table(:blog_posts) do
      add :featured_image, :string
    end
  end
end
