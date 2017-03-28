defmodule College.ExhibitionUserController do
  use College.Web, :controller

  alias College.ExhibitionUser

  def index(conn, _params) do
    exhibitions_users = Repo.all(ExhibitionUser)
    render(conn, "index.html", exhibitions_users: exhibitions_users)
  end

  def new(conn, _params) do
    changeset = ExhibitionUser.changeset(%ExhibitionUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"exhibition_user" => exhibition_user_params}) do
    changeset = ExhibitionUser.changeset(%ExhibitionUser{}, exhibition_user_params)

    case Repo.insert(changeset) do
      {:ok, _exhibition_user} ->
        conn
        |> put_flash(:info, "Exhibition user created successfully.")
        |> redirect(to: exhibition_user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exhibition_user = Repo.get!(ExhibitionUser, id)
    render(conn, "show.html", exhibition_user: exhibition_user)
  end

  def edit(conn, %{"id" => id}) do
    exhibition_user = Repo.get!(ExhibitionUser, id)
    changeset = ExhibitionUser.changeset(exhibition_user)
    render(conn, "edit.html", exhibition_user: exhibition_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exhibition_user" => exhibition_user_params}) do
    exhibition_user = Repo.get!(ExhibitionUser, id)
    changeset = ExhibitionUser.changeset(exhibition_user, exhibition_user_params)

    case Repo.update(changeset) do
      {:ok, exhibition_user} ->
        conn
        |> put_flash(:info, "Exhibition user updated successfully.")
        |> redirect(to: exhibition_user_path(conn, :show, exhibition_user))
      {:error, changeset} ->
        render(conn, "edit.html", exhibition_user: exhibition_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exhibition_user = Repo.get!(ExhibitionUser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(exhibition_user)

    conn
    |> put_flash(:info, "Exhibition user deleted successfully.")
    |> redirect(to: exhibition_user_path(conn, :index))
  end
end
