defmodule HelloWeb.Router do
  use HelloWeb, :router
  use ExAdmin.Router

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

  pipeline :auth do
    plug(Hello.Auth.AuthAccessPipeline)
  end

  pipeline :api_auth do
    plug Guardian.Plug.Pipeline, module: Hello.Auth.Guardian, error_handler: HelloWeb.FallbackController
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated
  end

  # setup the ExAdmin routes on /admin
  scope "/admin", ExAdmin do
    pipe_through [:browser, :auth]
    admin_routes()
  end

  ## Unauthenticated Web
  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # resources("/users", UserController, only: [:new, :create]) # disabled so accounts can only be created by authenticated users
    resources("/sessions", SessionController, only: [:new, :create])
    resources "/youth", YouthClosedController, only: [:new]
    resources "/youth_late", YouthController, only: [:new, :create]
    resources "/adult", AdultController, only: [:new, :create]

  end

  ## Authenticated Web
  scope "/", HelloWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    resources("/users", UserController, only: [:new, :create, :index, :show])
    resources("/sessions", SessionController, only: [:delete])

    resources "/youth", YouthController, only: [:index, :show]
    resources "/adult", AdultController, only: [:index, :show]

  end

  ## Unauthenticated API
  scope "/api", HelloWeb do
       pipe_through :api

       resources("/sessions", SessionAPIController, only: [:create])
  end

  ## Authenticated API
  scope "/api", HelloWeb do
    pipe_through [:api, :api_auth]

    resources "/youths", YouthAPIController, only: [:index, :show]

  end
end

# activity_name: string (preselected)
# activity_date: string (preselected)
# ward: string (pick from list)
# stake: string (preselected)
# name: string (single field)
# date_of_birth: date/string
# phone_number: string
# parent_guardian_name: string
# parent_phone_number: string
# address: string
# city:string
# province: string
# medical_condition: select options
# medical_condition_comment: strin  g
# signature: checkbox/image?
# submission_date: date/string

