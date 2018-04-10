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

  # setup the ExAdmin routes on /admin
  scope "/admin", ExAdmin do
    pipe_through [:browser, :auth]
    admin_routes()
  end

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # resources("/users", UserController, only: [:new, :create]) # disabled so accounts can only be created by authenticated users
    resources("/sessions", SessionController, only: [:new, :create])

    resources "/youth", YouthController, only: [:new, :create]
    resources "/adult", AdultController, only: [:new, :create]

  end

  scope "/", HelloWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    resources("/users", UserController, only: [:new, :create, :index, :show])
    resources("/sessions", SessionController, only: [:delete])

    resources "/youth", YouthController, only: [:index, :show]
    resources "/adult", AdultController, only: [:index, :show]

  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  #
  #   # resources "/youth", YouthController, only: [:new, :create]
  #   resources "/youth", YouthController, only: [:index]
  #   # resources "/leader", LeaderController, only: [:new, :create]
  #
  # end
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

