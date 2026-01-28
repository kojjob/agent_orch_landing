defmodule AgentOrchLanding.Leads do
  import Ecto.Query
  alias AgentOrchLanding.Repo
  alias AgentOrchLanding.Leads.{EmailCapture, DesignPartner, ContactSubmission}

  # Email Captures

  def create_email_capture(attrs \\ %{}) do
    %EmailCapture{}
    |> EmailCapture.changeset(attrs)
    |> Repo.insert()
  end

  def get_email_capture(id), do: Repo.get(EmailCapture, id)

  def get_email_capture_by_email(email) do
    Repo.get_by(EmailCapture, email: String.downcase(String.trim(email)))
  end

  def list_email_captures do
    EmailCapture |> order_by(desc: :captured_at) |> Repo.all()
  end

  def change_email_capture(%EmailCapture{} = email_capture, attrs \\ %{}) do
    EmailCapture.changeset(email_capture, attrs)
  end

  # Contact Submissions

  def create_contact_submission(attrs \\ %{}) do
    %ContactSubmission{}
    |> ContactSubmission.changeset(attrs)
    |> Repo.insert()
  end

  def list_contact_submissions do
    ContactSubmission |> order_by(desc: :submitted_at) |> Repo.all()
  end

  def change_contact_submission(%ContactSubmission{} = submission, attrs \\ %{}) do
    ContactSubmission.changeset(submission, attrs)
  end

  # Design Partners

  def create_design_partner(attrs \\ %{}) do
    %DesignPartner{}
    |> DesignPartner.changeset(attrs)
    |> Repo.insert()
  end

  def get_design_partner(id), do: Repo.get(DesignPartner, id)

  def get_design_partner_by_email(email) do
    Repo.get_by(DesignPartner, email: String.downcase(String.trim(email)))
  end

  def list_design_partners do
    DesignPartner |> order_by(desc: :submitted_at) |> Repo.all()
  end

  def change_design_partner(%DesignPartner{} = design_partner, attrs \\ %{}) do
    DesignPartner.changeset(design_partner, attrs)
  end
end
