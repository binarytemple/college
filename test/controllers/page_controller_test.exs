defmodule College.PageControllerTest do
  use College.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/" , []
    assert html_response(conn, 200) =~ 
    "Welcome to #{ Application.get_env(:college,:identity) }"
  end
end
