defmodule College.UserAuthentication do
 
  alias Phoenix.Controller
  alias Plug.Conn

  def init(opts), do: opts

  def authenticated?(conn) do
    # Implement authentication logic here, e.g. check auth headers,
    # session creds, etc.
    case Conn.get_session(conn, :current_user) do
      nil -> false
      _ -> true
    end

  end

  def call(conn, _opts) do
    conn = conn |> Conn.fetch_session |> Controller.fetch_flash
    if authenticated?(conn) do
      conn
    else
      conn = conn
      #|> send_resp(401, "")
      #|> halt
      |> Controller.put_flash(:error, "unauthenticated")
      |> Controller.redirect(to: "/admin")
      |> Conn.halt
    end
  end
end

