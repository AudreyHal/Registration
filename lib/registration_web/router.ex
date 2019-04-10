defmodule RegistrationWeb.Router do
  use RegistrationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
   # plug RegistrationWeb.Plugs.Loadstudent
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :frontend do
    plug RegistrationWeb.Plugs.LoadStudent
  end

  scope "/", RegistrationWeb do
    pipe_through [:browser, :frontend]


    get "/signup", SignupController, :new
    post "/signup", SignupController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end



  scope "/", RegistrationWeb do
    pipe_through [:browser, :frontend, RegistrationWeb.Plugs.AuthenticateStudent]

    get "/", PageController, :index
    resources "/courses", CourseController
    get "/course/student", CourseController, :view
    get "/logout", SessionController, :delete
    resources "/papers", PaperController

  end
  # Other scopes may use custom stacks.
  # scope "/api", RegistrationWeb do
  #   pipe_through :api
  # end
end
