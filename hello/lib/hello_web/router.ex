defmodule HelloWeb.Router do
  use HelloWeb, :router

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

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
        
    resources "/youth", YouthController, only: [:index, :show, :new, :create]
    resources "/leader", LeaderController, only: [:new, :create]
        
  end
    
  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
    pipe_through :api
    
    #resources "/youth", YouthController, only: [:new, :create]
    resources "/leader", LeaderController, only: [:new, :create]
    
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

