defmodule College.ExhibitionControllerTest do
  use College.ConnCase

  alias College.Exhibition
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, exhibition_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing exhibitions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, exhibition_path(conn, :new)
    assert html_response(conn, 200) =~ "New exhibition"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, exhibition_path(conn, :create), exhibition: @valid_attrs
    assert redirected_to(conn) == exhibition_path(conn, :index)
    assert Repo.get_by(Exhibition, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, exhibition_path(conn, :create), exhibition: @invalid_attrs
    assert html_response(conn, 200) =~ "New exhibition"
  end

  test "shows chosen resource", %{conn: conn} do
    exhibition = Repo.insert! %Exhibition{}
    conn = get conn, exhibition_path(conn, :show, exhibition)
    assert html_response(conn, 200) =~ "Show exhibition"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, exhibition_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    exhibition = Repo.insert! %Exhibition{}
    conn = get conn, exhibition_path(conn, :edit, exhibition)
    assert html_response(conn, 200) =~ "Edit exhibition"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    exhibition = Repo.insert! %Exhibition{}
    conn = put conn, exhibition_path(conn, :update, exhibition), exhibition: @valid_attrs
    assert redirected_to(conn) == exhibition_path(conn, :show, exhibition)
    assert Repo.get_by(Exhibition, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    exhibition = Repo.insert! %Exhibition{}
    conn = put conn, exhibition_path(conn, :update, exhibition), exhibition: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit exhibition"
  end

  test "deletes chosen resource", %{conn: conn} do
    exhibition = Repo.insert! %Exhibition{}
    conn = delete conn, exhibition_path(conn, :delete, exhibition)
    assert redirected_to(conn) == exhibition_path(conn, :index)
    refute Repo.get(Exhibition, exhibition.id)
  end
end
