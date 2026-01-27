defmodule AgentOrchLanding.Repo do
  use Ecto.Repo,
    otp_app: :agent_orch_landing,
    adapter: Ecto.Adapters.Postgres
end
