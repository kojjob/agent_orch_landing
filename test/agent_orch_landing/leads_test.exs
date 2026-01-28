defmodule AgentOrchLanding.LeadsTest do
  use AgentOrchLanding.DataCase, async: true

  alias AgentOrchLanding.Leads
  alias AgentOrchLanding.Leads.{EmailCapture, DesignPartner}

  describe "email_captures" do
    @valid_attrs %{email: "test@example.com", source: "landing", variant: "v1"}

    test "create_email_capture/1 with valid data creates an email capture" do
      assert {:ok, %EmailCapture{} = capture} = Leads.create_email_capture(@valid_attrs)
      assert capture.email == "test@example.com"
      assert capture.source == "landing"
      assert capture.variant == "v1"
      assert capture.captured_at != nil
    end

    test "create_email_capture/1 downcases and trims email" do
      assert {:ok, capture} = Leads.create_email_capture(%{email: "  TEST@Example.COM  "})
      assert capture.email == "test@example.com"
    end

    test "create_email_capture/1 with missing email returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Leads.create_email_capture(%{})
    end

    test "create_email_capture/1 with invalid email returns error changeset" do
      assert {:error, changeset} = Leads.create_email_capture(%{email: "not-an-email"})
      assert %{email: ["must be a valid email"]} = errors_on(changeset)
    end

    test "create_email_capture/1 with duplicate email returns error changeset" do
      assert {:ok, _} = Leads.create_email_capture(@valid_attrs)
      assert {:error, changeset} = Leads.create_email_capture(@valid_attrs)
      assert %{email: ["has already been registered"]} = errors_on(changeset)
    end

    test "get_email_capture_by_email/1 returns the capture" do
      {:ok, capture} = Leads.create_email_capture(@valid_attrs)
      assert Leads.get_email_capture_by_email("test@example.com").id == capture.id
    end

    test "list_email_captures/0 returns all captures" do
      {:ok, _} = Leads.create_email_capture(%{email: "a@test.com"})
      {:ok, _} = Leads.create_email_capture(%{email: "b@test.com"})
      assert length(Leads.list_email_captures()) == 2
    end
  end

  describe "contact_submissions" do
    @valid_attrs %{
      name: "Jane Doe",
      email: "jane@example.com",
      subject: "general",
      message: "I'd like to learn more about AgentOrch."
    }

    test "create_contact_submission/1 with valid data creates a submission" do
      assert {:ok, %Leads.ContactSubmission{} = sub} = Leads.create_contact_submission(@valid_attrs)
      assert sub.name == "Jane Doe"
      assert sub.email == "jane@example.com"
      assert sub.subject == "general"
      assert sub.message == "I'd like to learn more about AgentOrch."
      assert sub.submitted_at != nil
    end

    test "create_contact_submission/1 downcases and trims email" do
      assert {:ok, sub} = Leads.create_contact_submission(%{@valid_attrs | email: "  JANE@Example.COM  "})
      assert sub.email == "jane@example.com"
    end

    test "create_contact_submission/1 requires name, email, subject, message" do
      assert {:error, changeset} = Leads.create_contact_submission(%{})
      errors = errors_on(changeset)
      assert errors[:name]
      assert errors[:email]
      assert errors[:subject]
      assert errors[:message]
    end

    test "create_contact_submission/1 with invalid email returns error" do
      assert {:error, changeset} = Leads.create_contact_submission(%{@valid_attrs | email: "bad"})
      assert %{email: ["must be a valid email"]} = errors_on(changeset)
    end

    test "list_contact_submissions/0 returns all submissions ordered by submitted_at" do
      {:ok, _} = Leads.create_contact_submission(@valid_attrs)
      {:ok, _} = Leads.create_contact_submission(%{@valid_attrs | email: "other@test.com", name: "Other"})
      assert length(Leads.list_contact_submissions()) == 2
    end
  end

  describe "design_partners" do
    @valid_attrs %{
      email: "partner@company.com",
      company: "Acme Corp",
      agent_count: "10-50",
      pain_point: "Agents fail silently in production"
    }

    test "create_design_partner/1 with valid data creates a design partner" do
      assert {:ok, %DesignPartner{} = partner} = Leads.create_design_partner(@valid_attrs)
      assert partner.email == "partner@company.com"
      assert partner.company == "Acme Corp"
      assert partner.agent_count == "10-50"
      assert partner.pain_point == "Agents fail silently in production"
      assert partner.submitted_at != nil
    end

    test "create_design_partner/1 requires all fields" do
      assert {:error, changeset} = Leads.create_design_partner(%{email: "a@b.com"})
      errors = errors_on(changeset)
      assert errors[:company]
      assert errors[:agent_count]
      assert errors[:pain_point]
    end

    test "create_design_partner/1 with duplicate email returns error" do
      assert {:ok, _} = Leads.create_design_partner(@valid_attrs)
      assert {:error, changeset} = Leads.create_design_partner(@valid_attrs)
      assert %{email: ["has already been registered"]} = errors_on(changeset)
    end

    test "list_design_partners/0 returns all partners" do
      {:ok, _} = Leads.create_design_partner(@valid_attrs)
      assert length(Leads.list_design_partners()) == 1
    end
  end
end
