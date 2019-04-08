defmodule RegistrationWeb.Router do
  use RegistrationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RegistrationWeb.Plugs.Loadstudent
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RegistrationWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/signup", SignupController, :new
    post "/signup", SignupController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
    resources "/courses", CourseController
    get "/course/student", CourseController, :view

  end

  # Other scopes may use custom stacks.
  # scope "/api", RegistrationWeb do
  #   pipe_through :api
  # end
end
