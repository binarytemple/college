defmodule College.UserSearchController do
  use College.Web, :controller

  alias College.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"q" => q}) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end


  #def create(conn, %{"user_search" => user_search_params}) do
  #  changeset = UserSearch.changeset(%UserSearch{}, user_search_params)

  #  case Repo.insert(changeset) do
  #    {:ok, user_search} ->
  #      conn
  #      |> put_status(:created)
  #      |> put_resp_header("location", user_search_path(conn, :show, user_search))
  #      |> render("show.json", user_search: user_search)
  #    {:error, changeset} ->
  #      conn
  #      |> put_status(:unprocessable_entity)
  #      |> render(College.ChangesetView, "error.json", changeset: changeset)
  #  end
  #end

  #def show(conn, %{"id" => id}) do
  #  user_search = Repo.get!(UserSearch, id)
  #  render(conn, "show.json", user_search: user_search)
  #end

  #def update(conn, %{"id" => id, "user_search" => user_search_params}) do
  #  user_search = Repo.get!(UserSearch, id)
  #  changeset = UserSearch.changeset(user_search, user_search_params)

  #  case Repo.update(changeset) do
  #    {:ok, user_search} ->
  #      render(conn, "show.json", user_search: user_search)
  #    {:error, changeset} ->
  #      conn
  #      |> put_status(:unprocessable_entity)
  #      |> render(College.ChangesetView, "error.json", changeset: changeset)
  #  end
  #end

  #def delete(conn, %{"id" => id}) do
  #  user_search = Repo.get!(UserSearch, id)

  #  # Here we use delete! (with a bang) because we expect
  #  # it to always work (and if it does not, it will raise).
  #  Repo.delete!(user_search)

  #  send_resp(conn, :no_content, "")
  #end
end
