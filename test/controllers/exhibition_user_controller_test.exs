defmodule College.ExhibitionUserControllerTest do
  use College.ConnCase

  alias College.ExhibitionUser
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, exhibition_user_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing exhibitions users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, exhibition_user_path(conn, :new)
    assert html_response(conn, 200) =~ "New exhibition user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, exhibition_user_path(conn, :create), exhibition_user: @valid_attrs
    assert redirected_to(conn) == exhibition_user_path(conn, :index)
    assert Repo.get_by(ExhibitionUser, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, exhibition_user_path(conn, :create), exhibition_user: @invalid_attrs
    assert html_response(conn, 200) =~ "New exhibition user"
  end

  test "shows chosen resource", %{conn: conn} do
    exhibition_user = Repo.insert! %ExhibitionUser{}
    conn = get conn, exhibition_user_path(conn, :show, exhibition_user)
    assert html_response(conn, 200) =~ "Show exhibition user"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, exhibition_user_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    exhibition_user = Repo.insert! %ExhibitionUser{}
    conn = get conn, exhibition_user_path(conn, :edit, exhibition_user)
    assert html_response(conn, 200) =~ "Edit exhibition user"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    exhibition_user = Repo.insert! %ExhibitionUser{}
    conn = put conn, exhibition_user_path(conn, :update, exhibition_user), exhibition_user: @valid_attrs
    assert redirected_to(conn) == exhibition_user_path(conn, :show, exhibition_user)
    assert Repo.get_by(ExhibitionUser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    exhibition_user = Repo.insert! %ExhibitionUser{}
    conn = put conn, exhibition_user_path(conn, :update, exhibition_user), exhibition_user: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit exhibition user"
  end

  test "deletes chosen resource", %{conn: conn} do
    exhibition_user = Repo.insert! %ExhibitionUser{}
    conn = delete conn, exhibition_user_path(conn, :delete, exhibition_user)
    assert redirected_to(conn) == exhibition_user_path(conn, :index)
    refute Repo.get(ExhibitionUser, exhibition_user.id)
  end
end
