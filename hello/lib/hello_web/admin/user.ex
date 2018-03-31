defmodule HelloWeb.ExAdmin.User do
  use ExAdmin.Register

  alias Hello.Accounts
  alias Hello.Accounts.User

  register_resource User do

  end
end
