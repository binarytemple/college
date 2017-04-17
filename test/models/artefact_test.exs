defmodule College.ArtefactTest do
  use College.ModelCase

  alias College.Artefact

  @valid_attrs %{ description: "some content", 
                  image: %Plug.Upload{
                    content_type: "image/png",
                    filename: "tageki.png",
                    path: Path.expand( "./test_resources/tageki.png")}, 
                  title: "laura616222hepburn" ,
                  id: "00000000-0000-0000-0000-000000000000"
                } 
  
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
