defmodule College.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      alias College.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import College.Router.Helpers

      alias College.Helpers

      use ExUnit.Case, async: true
      use Plug.Test
      
      # The default endpoint for testing
      @endpoint College.Endpoint
    end
  end

  #  setup %{conn: conn,  } = config do
  #    if username = config[:login_as] do
  #
  #      #todo: write code to insert into database 
  #      #user =  Helpers.insert_user(username: username)
  #      #conn = Plug.Conn.assign(conn, :current_user, user)
  #
  #      alias Ueberauth.Auth
  #      alias Auth.Info
  #      alias Auth.Extra
  #      alias Auth.Credentials
  #
  #      user = %Auth{credentials: %Credentials{} ,strategy: :identity, info: %Info{email: username}, uid:  username }
  #      {:ok, conn: conn, user: user}
  #    else
  #      :ok
  #    end
  #  end


  def build_user(conn, username \\ "foo@bar.com" ) do
    alias Ueberauth.Auth
    alias Auth.Info
    alias Auth.Extra
    alias Auth.Credentials
    user = %Auth{credentials: %Credentials{}, strategy: :identity, info: %Info{email: username}, uid:  username}
    Plug.Test.init_test_session(conn, [current_user: user])
    #IO.inspect(ret)
  end
  
  setup config do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(College.Repo)
    #IO.puts(inspect(tags))
    unless config[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(College.Repo, {:shared, self()})
    end
    conn = Phoenix.ConnTest.build_conn()
    case config[:login_as] do
      nil -> {:ok, conn: build_user(conn)}
      username ->
	{:ok, conn: build_user(conn,username)}
    end
  end

end
