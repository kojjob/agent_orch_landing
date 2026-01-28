defmodule AgentOrchLanding.Leads.ContactSubmission do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "contact_submissions" do
    field :name, :string
    field :email, :string
    field :subject, :string
    field :message, :string
    field :submitted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  def changeset(contact_submission, attrs) do
    contact_submission
    |> cast(attrs, [:name, :email, :subject, :message])
    |> validate_required([:name, :email, :subject, :message])
    |> update_change(:email, &String.downcase(String.trim(&1)))
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/, message: "must be a valid email")
    |> put_submitted_at()
  end

  defp put_submitted_at(changeset) do
    if changeset.valid? do
      put_change(changeset, :submitted_at, DateTime.utc_now() |> DateTime.truncate(:second))
    else
      changeset
    end
  end
end
