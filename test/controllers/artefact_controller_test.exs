defmodule College.ArtefactControllerTest do
  use College.ConnCase
  alias College.Artefact

  @valid_attrs %{ description: "some content", 
                  image: %Plug.Upload{
                    content_type: "image/png",
                    filename: "tageki.png",
                    path: Path.expand( "./test_resources/tageki.png")}, 
                  title: "laura616222hepburn" } 

  @invalid_attrs %{}
  @dummy_id "00000000-0000-0000-0000-000000000000"

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artefact_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing artefacts"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, artefact_path(conn, :new)
     html_response(conn, 200) =~ "New artefact"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, artefact_path(conn, :create), artefact: @valid_attrs
    assert redirected_to(conn) == artefact_path(conn, :index)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artefact_path(conn, :create), artefact: @invalid_attrs
    assert html_response(conn, 200) =~ "New artefact"
  end

  test "shows chosen resource", %{conn: conn} do
    artefact = Repo.insert! %Artefact{id: UUID.uuid4}
    conn = get conn, artefact_path(conn, :show, artefact)
    assert html_response(conn, 200) =~ "Show artefact"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, artefact_path(conn, :show, UUID.uuid4)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    artefact = Repo.insert! %Artefact{id: @dummy_id}
    conn = get conn, artefact_path(conn, :edit, artefact)
    assert html_response(conn, 200) =~ "Edit artefact"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    artefact = Repo.insert! %Artefact{id: @dummy_id}
    conn = put conn, artefact_path(conn, :update, artefact), artefact: @valid_attrs
    assert redirected_to(conn) == artefact_path(conn, :show, artefact)
    assert Repo.get(Artefact, @dummy_id)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artefact = Repo.insert! %Artefact{id: @dummy_id}
    conn = put conn, artefact_path(conn, :update, artefact), artefact: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit artefact"
  end

  test "deletes chosen resource", %{conn: conn} do
    artefact = Repo.insert! %Artefact{id: @dummy_id}
    conn = delete conn, artefact_path(conn, :delete, artefact)
    assert redirected_to(conn) == artefact_path(conn, :index)
    refute Repo.get(Artefact, artefact.id)
  end
end
