defmodule College.UserCourseTest do
  use College.ModelCase

  alias College.UserCourse

  @valid_attrs %{user_id: 1, course_id: 1}
  @invalid_attrs %{bad: "bad content"}
  
  test "changeset with valid attributes" do
    changeset = UserCourse.changeset(%UserCourse{}, @valid_attrs)
    assert changeset.valid?
  end

	test "changeset with invalid attributes" do
    changeset = UserCourse.changeset(%UserCourse{}, @invalid_attrs)
    refute changeset.valid?
  end
end
