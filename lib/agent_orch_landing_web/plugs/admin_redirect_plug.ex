defmodule AgentOrchLandingWeb.AdminRedirectPlug do
  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> redirect(to: "/admin/blog")
    |> halt()
  end
end
