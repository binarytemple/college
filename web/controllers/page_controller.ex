defmodule College.PageController do
  use College.Web, :controller

  @identity Application.get_env(:college,:identity)

  #def index(conn, %{"name" => name}) do
  #  render(conn, "index.html", [{:name ,@identity}]  )
  #end

  def index(conn, _params) do
    render(conn, "index.html", [{:identity,@identity}] )
  end
end
