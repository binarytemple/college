defmodule College.UserController do
  use College.Web, :controller

  alias College.User
  require Logger

  plug :load_salutations when action in [:new, :create, :edit, :update]

  defp load_salutations(conn, _) do 
    #  query = Category |> Category.alphabetical |> Category.names_and_ids
    #  categories = Repo.all query
    salutations = [
      {"Mr"   , "mr"  }   ,
      {"Mrs"  , "mrs"  }  ,
      {"Miss" , "miss"  }
   ]   
    assign(conn, :salutations, salutations) 
  end


  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

  def show_edit_password(conn, %{"id" => id}) do
    user      = Repo.get!(User, id)
    changeset = Ecto.Changeset.change(user)
    render(conn, "show_edit_password.html", changeset: changeset)
  end

  def save_edit_password(conn, %{"id" => id, "user" => password_params}) do
    import Ecto.Changeset

    user      = Repo.get!(User, id)
    req       = [:password_supplied,:password_supplied_confirmation]

    #IO.inspect(password_params)
    changeset = cast(user, password_params, req)
      |> validate_required(req) 
      |> validate_confirmation(:password_supplied, message: "does not match password") 
      |> cast( %{:password => Comeonin.Bcrypt.hashpwsalt(password_params["password_supplied"])}, [:password] )

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User password update successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        #render(conn, "confirm_.html", changeset: changeset)
        render(conn, "show_edit_password.html", user: user, changeset: changeset)
    end

  end


  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    user = Map.update(user, :email_confirmation, user.email, fn(_) -> user.email end)
    #Logger.debug("#{inspect(user)}")
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
