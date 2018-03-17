defmodule HelloWeb.UserView do
  use HelloWeb, :view

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.name}
  end
end
