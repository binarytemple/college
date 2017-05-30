defmodule College.CredentialsControllerTest do
  use College.ConnCase

  alias College.Credentials
  @valid_attrs %{email: "some content", password: "some content", strategy: "some content", token1: "some content"}
  @invalid_attrs %{}

  #  test "lists all entries on index", %{conn: conn} do
  #    conn = get conn, credentials_path(conn, :index)
  #    assert html_response(conn, 200) =~ "Listing credentials"
  #  end
  #
  #  test "renders form for new resources", %{conn: conn} do
  #    conn = get conn, credentials_path(conn, :new)
  #    assert html_response(conn, 200) =~ "New credentials"
  #  end
  #
  #  test "creates resource and redirects when data is valid", %{conn: conn} do
  #    conn = post conn, credentials_path(conn, :create), credentials: @valid_attrs
  #    assert redirected_to(conn) == credentials_path(conn, :index)
  #    assert Repo.get_by(Credentials, @valid_attrs)
  #  end
  #
  #  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #    conn = post conn, credentials_path(conn, :create), credentials: @invalid_attrs
  #    assert html_response(conn, 200) =~ "New credentials"
  #  end
  #
  #  test "shows chosen resource", %{conn: conn} do
  #    credentials = Repo.insert! %Credentials{}
  #    conn = get conn, credentials_path(conn, :show, credentials)
  #    assert html_response(conn, 200) =~ "Show credentials"
  #  end
  #
  #  test "renders page not found when id is nonexistent", %{conn: conn} do
  #    assert_error_sent 404, fn ->
  #      get conn, credentials_path(conn, :show, -1)
  #    end
  #  end
  #
  #  test "renders form for editing chosen resource", %{conn: conn} do
  #    credentials = Repo.insert! %Credentials{}
  #    conn = get conn, credentials_path(conn, :edit, credentials)
  #    assert html_response(conn, 200) =~ "Edit credentials"
  #  end
  #
  #  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #    credentials = Repo.insert! %Credentials{}
  #    conn = put conn, credentials_path(conn, :update, credentials), credentials: @valid_attrs
  #    assert redirected_to(conn) == credentials_path(conn, :show, credentials)
  #    assert Repo.get_by(Credentials, @valid_attrs)
  #  end
  #
  #  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #    credentials = Repo.insert! %Credentials{}
  #    conn = put conn, credentials_path(conn, :update, credentials), credentials: @invalid_attrs
  #    assert html_response(conn, 200) =~ "Edit credentials"
  #  end
  #
  #  test "deletes chosen resource", %{conn: conn} do
  #    credentials = Repo.insert! %Credentials{}
  #    conn = delete conn, credentials_path(conn, :delete, credentials)
  #    assert redirected_to(conn) == credentials_path(conn, :index)
  #    refute Repo.get(Credentials, credentials.id)
  #  end
end
