defmodule College.Router do
  use College.Web, :router

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

  scope "/", College do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

      resources "/users", UserController
      resources "/artefacts", ArtefactController
      resources "/courses", CourseController
      resources "/user_courses", UserCourseController
      resources "/exhibitions", ExhibitionController
      resources "/exhibitions_users", ExhibitionUserController

  end

  # Other scopes may use custom stacks.
  # scope "/api", College do
  #   pipe_through :api
  # end
end
