defmodule AgentOrchLandingWeb.PageController do
  use AgentOrchLandingWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
