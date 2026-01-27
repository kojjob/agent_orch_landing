defmodule AgentOrchLanding.Repo.Migrations.CreateEmailCaptures do
  use Ecto.Migration

  def change do
    create table(:email_captures, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string, null: false
      add :source, :string, default: "landing"
      add :variant, :string
      add :captured_at, :utc_datetime, default: fragment("now()")

      timestamps(type: :utc_datetime)
    end

    create unique_index(:email_captures, [:email])
  end
end
