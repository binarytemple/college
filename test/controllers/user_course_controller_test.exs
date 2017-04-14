defmodule College.UserCourseControllerTest do
  use College.ConnCase

  alias College.UserCourse
  alias College.User
  alias College.Course

  defp mkuser, do: %{ dob: "1999-01-01", forname: "some content", is_student: true,
      location: "some content", photo: "some content", salutation: "some content",
  surname: "some content", email: UUID.uuid1 <> "@foo.com"}

  @valid_course_attrs %{ title: UUID.uuid1 }

  @valid_attrs %{user_id: 1, course_id: 1}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_course_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing user courses"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_course_path(conn, :new)
    assert html_response(conn, 200) =~ "New user course"
  end

  def generate_user_and_course do
    {:ok, user_changeset  } = Repo.insert( User.changeset(%User{}, mkuser()) )
    {:ok, course_changeset } = Repo.insert(Course.changeset(%Course{}, @valid_course_attrs) )
    {user_changeset,course_changeset}
  end

  def generate_user_course do
    {user_changeset,course_changeset} = generate_user_and_course()
    {:ok, user_course} = Repo.insert(UserCourse.changeset(%UserCourse{}, %{user_id: user_changeset.id, course_id: course_changeset.id  }))
    user_course
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    {user_changeset,course_changeset} = generate_user_and_course()
    user_course_params = %{user_id: user_changeset.id, course_id: course_changeset.id }
    #IO.inspect(" #{inspect(  {user_changeset,course_changeset}  )}  ")
    conn = post conn, user_course_path(conn, :create), user_course: user_course_params
    assert redirected_to(conn) == user_course_path(conn, :index)
    assert Repo.get_by(UserCourse,   %{user_id: user_changeset.id, course_id: course_changeset.id  })
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_course_path(conn, :create), user_course: @invalid_attrs
    assert html_response(conn, 200) =~ "New user course"
  end

  test "shows chosen resource", %{conn: conn} do
    %UserCourse{user_id: user_id, course_id: course_id} = generate_user_course

    conn = get conn, user_course_path(conn, :show), user_course: %{user_id:  user_id, course_id: course_id }
    assert html_response(conn, 200) =~ "Show user course"
  end
#
#  test "renders page not found when id is nonexistent", %{conn: conn} do
#    assert_error_sent 404, fn ->
#      get conn, user_course_path(conn, :show, -1)
#    end
#  end
#
#  test "renders form for editing chosen resource", %{conn: conn} do
#    user_course = Repo.insert! %UserCourse{}
#    conn = get conn, user_course_path(conn, :edit, user_course)
#    assert html_response(conn, 200) =~ "Edit user course"
#  end
#
#  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
#
#
#    user_course = Repo.insert! %UserCourse{}
#    conn = put conn, user_course_path(conn, :update, user_course), user_course: @valid_attrs
#    assert redirected_to(conn) == user_course_path(conn, :show, user_course)
#    assert Repo.get_by(UserCourse, @valid_attrs)
#  end
#
#  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
#    user_course = Repo.insert! %UserCourse{}
#    conn = put conn, user_course_path(conn, :update, user_course), user_course: @invalid_attrs
#    assert html_response(conn, 200) =~ "Edit user course"
#  end
#
  test "deletes chosen resource", %{conn: conn} do
    user_course = Repo.insert! %UserCourse{}
    conn = delete conn, user_course_path(conn, :delete, user_course)
    assert redirected_to(conn) == user_course_path(conn, :index)
    refute Repo.get(UserCourse, user_course.id)
  end
end
