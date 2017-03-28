defmodule College.ExhibitionController do
  use College.Web, :controller

  alias College.Exhibition

  def index(conn, _params) do
    exhibitions = Repo.all(Exhibition)
    render(conn, "index.html", exhibitions: exhibitions)
  end

  def new(conn, _params) do
    changeset = Exhibition.changeset(%Exhibition{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"exhibition" => exhibition_params}) do
    changeset = Exhibition.changeset(%Exhibition{}, exhibition_params)

    case Repo.insert(changeset) do
      {:ok, _exhibition} ->
        conn
        |> put_flash(:info, "Exhibition created successfully.")
        |> redirect(to: exhibition_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exhibition = Repo.get!(Exhibition, id)
    render(conn, "show.html", exhibition: exhibition)
  end

  def edit(conn, %{"id" => id}) do
    exhibition = Repo.get!(Exhibition, id)
    changeset = Exhibition.changeset(exhibition)
    render(conn, "edit.html", exhibition: exhibition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exhibition" => exhibition_params}) do
    exhibition = Repo.get!(Exhibition, id)
    changeset = Exhibition.changeset(exhibition, exhibition_params)

    case Repo.update(changeset) do
      {:ok, exhibition} ->
        conn
        |> put_flash(:info, "Exhibition updated successfully.")
        |> redirect(to: exhibition_path(conn, :show, exhibition))
      {:error, changeset} ->
        render(conn, "edit.html", exhibition: exhibition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exhibition = Repo.get!(Exhibition, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(exhibition)

    conn
    |> put_flash(:info, "Exhibition deleted successfully.")
    |> redirect(to: exhibition_path(conn, :index))
  end
end
