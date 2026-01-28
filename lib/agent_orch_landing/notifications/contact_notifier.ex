defmodule AgentOrchLanding.Notifications.ContactNotifier do
  import Swoosh.Email

  alias AgentOrchLanding.Mailer

  @from {"AgentOrch", "noreply@agentorch.dev"}
  @to {"AgentOrch Team", "hello@agentorch.dev"}

  def submission_received(%{name: name, email: contact_email, subject: subject, message: message}) do
    email =
      new()
      |> to(@to)
      |> from(@from)
      |> subject("New contact submission from #{name}")
      |> text_body("""
      New contact form submission:

      Name: #{name}
      Email: #{contact_email}
      Subject: #{subject}

      Message:
      #{message}
      """)

    with {:ok, _metadata} <- Mailer.deliver(email) do
      {:ok, email}
    end
  end
end
