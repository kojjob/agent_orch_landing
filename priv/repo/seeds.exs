# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AgentOrchLanding.Repo.insert!(%AgentOrchLanding.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AgentOrchLanding.Blog

Blog.create_post(%{
  title: "Introducing AgentOrch: AI Agent Orchestration for Teams",
  slug: "introducing-agentorch",
  excerpt: "Today we're launching AgentOrch — the orchestration platform that gives teams visibility and control over their AI agents in production.",
  body: """
  <h2>Why Agent Orchestration Matters</h2>
  <p>AI agents are transforming how software gets built and operated. But as organizations deploy more agents, a critical gap has emerged: there's no way to see what agents are doing, coordinate between them, or control costs and behavior.</p>
  <p>AgentOrch fills that gap. We provide the monitoring, coordination, and governance layer that sits between your agents and your business.</p>
  <h2>What You Get</h2>
  <ul>
    <li><strong>Real-time visibility</strong> — See every agent action, decision, and outcome as it happens.</li>
    <li><strong>Smart coordination</strong> — Prevent conflicts and optimize agent collaboration automatically.</li>
    <li><strong>Cost controls</strong> — Set budgets, track spend, and prevent runaway costs.</li>
    <li><strong>Governance</strong> — Define policies, enforce guardrails, and maintain audit trails.</li>
  </ul>
  <h2>Join the Waitlist</h2>
  <p>We're onboarding teams in waves. Sign up on our homepage to get early access and help shape the product.</p>
  """,
  author: "Sarah Chen",
  published_at: DateTime.utc_now() |> DateTime.truncate(:second)
})
