defmodule College.ArtefactController do
  use College.Web, :controller

  alias College.Artefact

  def index(conn, _params) do
    artefacts = Repo.all(Artefact)
    render(conn, "index.html", artefacts: artefacts)
  end

  def new(conn, _params) do
    changeset = Artefact.changeset(%Artefact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artefact" => artefact_params}) do
    changeset = Artefact.changeset(%Artefact{}, artefact_params)

    case Repo.insert(changeset) do
      {:ok, _artefact} ->
        conn
        |> put_flash(:info, "Artefact created successfully.")
        |> redirect(to: artefact_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artefact = Repo.get!(Artefact, id)
    render(conn, "show.html", artefact: artefact)
  end

  def edit(conn, %{"id" => id}) do
    artefact = Repo.get!(Artefact, id)
    changeset = Artefact.changeset(artefact)
    render(conn, "edit.html", artefact: artefact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artefact" => artefact_params}) do
    artefact = Repo.get!(Artefact, id)
    changeset = Artefact.changeset(artefact, artefact_params)

    case Repo.update(changeset) do
      {:ok, artefact} ->
        conn
        |> put_flash(:info, "Artefact updated successfully.")
        |> redirect(to: artefact_path(conn, :show, artefact))
      {:error, changeset} ->
        render(conn, "edit.html", artefact: artefact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artefact = Repo.get!(Artefact, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artefact)

    conn
    |> put_flash(:info, "Artefact deleted successfully.")
    |> redirect(to: artefact_path(conn, :index))
  end
end
