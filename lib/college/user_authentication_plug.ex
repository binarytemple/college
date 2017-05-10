defmodule College.UserAuthentication do
  import Plug.Conn

  def init(opts), do: opts

  def authenticated?(conn) do
    # Implement authentication logic here, e.g. check auth headers,
    # session creds, etc.
    case get_session(conn, :current_user) do
      nil -> false
      _ -> true
    end

  end

  def call(conn, _opts) do
    if authenticated?(conn) do
      conn
    else
      conn
      |> send_resp(401, "")
      |> halt
    end
  end
end

