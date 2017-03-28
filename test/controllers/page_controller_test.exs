defmodule College.PageControllerTest do
  use College.ConnCase

  test "GET /", %{conn: conn} do
     name = "dave"
    conn = get conn, "/" , [name: name]
    assert html_response(conn, 200) =~ "Welcome to #{name}"
  end
end
