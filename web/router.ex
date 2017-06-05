defmodule College.Router do
  use College.Web, :router

  require Ueberauth
  alias College.UserSession
  alias College.UserAuthentication
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug UserSession
    plug College.LocalePlug
  end

  pipeline :user_authentication do
    plug UserAuthentication
  end
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", College do
    pipe_through :api
    resources "/user_search", UserSearchController
  end

  scope "/auth", College do
    pipe_through :browser
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  scope "/", College do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get "/artefacts", PageController, :artefacts
    get "/show_artefact", PageController, :show_artefact
    get "/admin", PageController, :admin_index
  end

  scope "/admin", College do
    pipe_through [:user_authentication,:browser  ] # Use the default browser stack
    resources "/artefacts", ArtefactController
    resources "/courses", CourseController
    resources "/credentials", CredentialsController
    resources "/exhibitions", ExhibitionController
    resources "/exhibitions_users", ExhibitionUserController
    resources "/user_courses", UserCourseController
    resources "/users", UserController
    get "/users/:id/show_edit_password",     UserController, :show_edit_password
    put "/users/:id/save_edit_password",     UserController, :save_edit_password
  end

end
