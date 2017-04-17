defmodule College.UserTest do
  use College.ModelCase

  alias College.User

  @valid_attrs %{ dob: "1999-01-01", forname: "x",
  is_student: true, location: "x", photo: "x",
  salutation: "x", surname: "x", email: UUID.uuid1 <> "@foo.com"}

  @valid_attrs_as_user_struct Ecto.Changeset.cast(%User{},
  Map.update(@valid_attrs,:dob,nil, &(elem(Ecto.Date.cast(&1 ),1))),  Map.keys(@valid_attrs))

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    #IO.inspect(changeset)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
