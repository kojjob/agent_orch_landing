defmodule AgentOrchLandingWeb.PageControllerTest do
  use AgentOrchLandingWeb.ConnCase

  test "GET / redirects to LiveView", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "AgentOrch"
  end
end
