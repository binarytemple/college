defmodule College.UserTest do
  use College.ModelCase

  alias College.User

  @valid_attrs %{age: 42, forname: "some content", is_student: true, location: "some content", photo: "some content", salutation: "some content", surname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
