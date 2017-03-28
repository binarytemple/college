defmodule College.PageController do
  use College.Web, :controller

  def index(conn, %{"name" => name}) do
    render(conn, "index.html", [{:name ,name}]  )
  end

  def index(conn, _params) do
    render(conn, "index.html", [{:name ,"anonymous"}]  )
  end
end
