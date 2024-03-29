defmodule College.ExhibitionUserTest do
  use College.ModelCase

  alias College.ExhibitionUser

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ExhibitionUser.changeset(%ExhibitionUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ExhibitionUser.changeset(%ExhibitionUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
