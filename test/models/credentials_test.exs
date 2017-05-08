defmodule College.CredentialsTest do
  use College.ModelCase

  alias College.Credentials

  @valid_attrs %{email: "some content", password: "some content", strategy: "some content", token1: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Credentials.changeset(%Credentials{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Credentials.changeset(%Credentials{}, @invalid_attrs)
    refute changeset.valid?
  end
end
