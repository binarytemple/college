defmodule College.PageController do
  use College.Web, :controller
  alias College.Artefact

  @identity Application.get_env(:college,:identity)

  #def index(conn, %{"name" => name}) do
  #  render(conn, "index.html", [{:name ,@identity}]  )
  #end

  def index(conn, _params) do
    conn = put_layout conn, "frontend.html" 
    render(conn, "index.html", [{:identity,@identity}] )
  end

  def admin_index(conn, _params) do
    render(conn, "index.html", [{:identity,@identity}] )
  end

  def artefacts(conn, _params) do
    artefacts = Repo.all(Artefact)
    conn = put_layout conn, "frontend.html" 
    render(conn,"artefacts.html", [artefacts: artefacts] )
  end

  def show_artefact(conn, %{"id" => id}) do
    artefact = Repo.get!(Artefact, id)
    put_layout conn, "frontend.html" |> render( "artefact.html", artefact: artefact )
  end
  
end
