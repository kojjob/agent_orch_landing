defmodule AgentOrchLanding.Repo.Migrations.CreateDesignPartners do
  use Ecto.Migration

  def change do
    create table(:design_partners, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string, null: false
      add :company, :string
      add :agent_count, :string
      add :pain_point, :text
      add :submitted_at, :utc_datetime, default: fragment("now()")

      timestamps(type: :utc_datetime)
    end

    create unique_index(:design_partners, [:email])
  end
end
