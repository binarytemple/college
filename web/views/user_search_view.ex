defmodule College.UserSearchView do
  use College.Web, :view
  require Logger

  def render("index.json", %{users: users}) do
    #def render("index.json", users) do
    %{data: render_many(users, College.UserSearchView, "user_search.json")}
    #Logger.warn("#{inspect(users)}")
    #%{data: %{users: users} }
  end

  #def render("show.json", %{user_search: user_search}) do
  #  %{data: render_one(user_search, College.UserSearchView, "user_search.json")}
  #end

  def render("user_search.json", %{user_search:  user} ) do
    Logger.warn("#{inspect(user)}")
    %{id: user.id,
      fulltext_name: user.fulltext_name}
  end
end
