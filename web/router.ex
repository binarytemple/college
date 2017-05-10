defmodule College.Router do
  use College.Web, :router

  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
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
    resources "/artefacts", ArtefactController
    resources "/courses", CourseController
    resources "/credentials", CredentialsController
    resources "/exhibitions", ExhibitionController
    resources "/exhibitions_users", ExhibitionUserController
    resources "/user_courses", UserCourseController
    resources "/users", UserController
  end

end
