defmodule College.ExhibitionTest do
  use College.ModelCase

  alias College.Exhibition

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Exhibition.changeset(%Exhibition{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Exhibition.changeset(%Exhibition{}, @invalid_attrs)
    refute changeset.valid?
  end
end
