defmodule College.LocalePlug do
  import Plug.Conn

  def init(opts), do: nil

  def call(conn, _opts) do
    case conn.params["locale"] ||  get_session(conn, :locale)  ||  extract_req_header(conn)   do
      nil     -> conn
      locale  ->
        dc_locale = String.downcase(locale)
        Gettext.put_locale(College.Gettext, dc_locale)
        conn |> put_session(:locale, dc_locale)
    end
  end

  defp extract_req_header(conn) do
    case  _extract_req_header(conn) do
      "" -> nil
      x -> x
    end
  end

  defp _extract_req_header(conn) do
    Plug.Conn.get_req_header(conn,"accept-language") |>
    List.to_string |>
    String.split(",") |>
    List.first |> 
    String.downcase 
  end

end
