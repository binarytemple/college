defmodule College.CredentialsController do
  use College.Web, :controller

  alias College.Credentials

  def index(conn, _params) do
    credentials = Repo.all(Credentials)
    render(conn, "index.html", credentials: credentials)
  end

  def new(conn, _params) do
    changeset = Credentials.changeset(%Credentials{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"credentials" => credentials_params}) do
    changeset = Credentials.changeset(%Credentials{}, credentials_params)

    case Repo.insert(changeset) do
      {:ok, _credentials} ->
        conn
        |> put_flash(:info, "Credentials created successfully.")
        |> redirect(to: credentials_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    credentials = Repo.get!(Credentials, id)
    render(conn, "show.html", credentials: credentials)
  end

  def edit(conn, %{"id" => id}) do
    credentials = Repo.get!(Credentials, id)
    changeset = Credentials.changeset(credentials)
    render(conn, "edit.html", credentials: credentials, changeset: changeset)
  end

  def update(conn, %{"id" => id, "credentials" => credentials_params}) do
    credentials = Repo.get!(Credentials, id)
    changeset = Credentials.changeset(credentials, credentials_params)

    case Repo.update(changeset) do
      {:ok, credentials} ->
        conn
        |> put_flash(:info, "Credentials updated successfully.")
        |> redirect(to: credentials_path(conn, :show, credentials))
      {:error, changeset} ->
        render(conn, "edit.html", credentials: credentials, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    credentials = Repo.get!(Credentials, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(credentials)

    conn
    |> put_flash(:info, "Credentials deleted successfully.")
    |> redirect(to: credentials_path(conn, :index))
  end
end
