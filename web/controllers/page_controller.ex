defmodule College.PageController do
  use College.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
