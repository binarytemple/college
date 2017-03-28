defmodule College.ArtefactTest do
  use College.ModelCase

  alias College.Artefact

  @valid_attrs %{description: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artefact.changeset(%Artefact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artefact.changeset(%Artefact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
