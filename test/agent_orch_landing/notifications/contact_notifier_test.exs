defmodule AgentOrchLanding.Notifications.ContactNotifierTest do
  use ExUnit.Case, async: true

  import Swoosh.TestAssertions

  alias AgentOrchLanding.Notifications.ContactNotifier

  describe "submission_received/1" do
    test "sends notification email with submission details" do
      submission = %{
        name: "Jane Doe",
        email: "jane@example.com",
        subject: "general",
        message: "I'd like to learn more about AgentOrch."
      }

      {:ok, email} = ContactNotifier.submission_received(submission)

      assert email.to == [{"AgentOrch Team", "hello@agentorch.dev"}]
      assert email.from == {"AgentOrch", "noreply@agentorch.dev"}
      assert email.subject == "New contact submission from Jane Doe"
      assert email.text_body =~ "Jane Doe"
      assert email.text_body =~ "jane@example.com"
      assert email.text_body =~ "general"
      assert email.text_body =~ "I'd like to learn more about AgentOrch."

      assert_email_sent(email)
    end
  end
end
