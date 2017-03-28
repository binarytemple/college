defmodule College.UserCourseTest do
  use College.ModelCase

  alias College.UserCourse

  @valid_attrs %{}
  @invalid_attrs %{bad: "bad content"}
  
  test "changeset with valid attributes" do
    changeset = UserCourse.changeset(%UserCourse{}, @valid_attrs)
    assert changeset.valid?
  end
			     test "changeset with invalid attributes" do
			       
			       changeset = UserCourse.changeset(%UserCourse{dave: "paul"},
				 @invalid_attrs)
    refute changeset.valid?
  end
end
