defmodule AgentOrchLanding.Leads.DesignPartner do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "design_partners" do
    field :email, :string
    field :company, :string
    field :agent_count, :string
    field :pain_point, :string
    field :submitted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  def changeset(design_partner, attrs) do
    design_partner
    |> cast(attrs, [:email, :company, :agent_count, :pain_point])
    |> validate_required([:email, :company, :agent_count, :pain_point])
    |> update_change(:email, &String.downcase(String.trim(&1)))
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/, message: "must be a valid email")
    |> unique_constraint(:email, message: "has already been registered")
    |> put_submitted_at()
  end

  defp put_submitted_at(changeset) do
    if get_change(changeset, :email) do
      put_change(changeset, :submitted_at, DateTime.utc_now() |> DateTime.truncate(:second))
    else
      changeset
    end
  end
end
