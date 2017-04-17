defmodule College.UserCourseController do
  use College.Web, :controller

  require Logger

  alias College.UserCourse

  def index(conn, _params) do
    user_courses = Repo.all(UserCourse)
    render(conn, "index.html", user_courses: user_courses)
  end

  def new(conn, _params) do
    changeset = UserCourse.changeset(%UserCourse{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn,
    _user_course = %{  "user_course" =>  %{"course_id" => course_id , "user_id" => user_id} } ) do
    changeset = UserCourse.changeset(%UserCourse{}, %{course_id: course_id , user_id: user_id} )
    #Logger.warn("user_course_params #{inspect(user_course)}")
    case Repo.insert(changeset) do
      {:ok, _user_course} ->
        conn
        |> put_flash(:info, "User course created successfully.")
        |> redirect(to: user_course_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create(conn, _params) do
    #Logger.warn("_params #{inspect(_params)}")
    changeset = UserCourse.changeset(%UserCourse{})
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    user_course = Repo.get!(UserCourse, id)
    render(conn, "show.html", user_course: user_course)
  end

  def edit(conn, %{"id" => id}) do
    user_course = Repo.get!(UserCourse, id)
    changeset = UserCourse.changeset(user_course)
    render(conn, "edit.html", user_course: user_course, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_course" => user_course_params}) do
    user_course = Repo.get!(UserCourse, id)
    changeset = UserCourse.changeset(user_course, user_course_params)
    case Repo.update(changeset) do
      {:ok, user_course} ->
        conn
        |> put_flash(:info, "User course updated successfully.")
        |> redirect(to: user_course_path(conn, :show, user_course))
      {:error, changeset} ->
        render(conn, "edit.html", user_course: user_course, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_course = Repo.get!(UserCourse, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_course)

    conn
    |> put_flash(:info, "User course deleted successfully.")
    |> redirect(to: user_course_path(conn, :index))
  end
end
