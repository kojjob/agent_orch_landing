defmodule AgentOrchLanding.Leads.EmailCapture do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "email_captures" do
    field :email, :string
    field :source, :string, default: "landing"
    field :variant, :string
    field :captured_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  def changeset(email_capture, attrs) do
    email_capture
    |> cast(attrs, [:email, :source, :variant])
    |> validate_required([:email])
    |> update_change(:email, &String.downcase(String.trim(&1)))
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/, message: "must be a valid email")
    |> unique_constraint(:email, message: "has already been registered")
    |> put_captured_at()
  end

  defp put_captured_at(changeset) do
    if get_change(changeset, :email) do
      put_change(changeset, :captured_at, DateTime.utc_now() |> DateTime.truncate(:second))
    else
      changeset
    end
  end
end
