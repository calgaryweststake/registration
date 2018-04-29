defmodule HelloWeb.SessionAPIView do
  use HelloWeb, :view
  alias HelloWeb.SessionAPIView

  def render("login.json", %{jwt: jwt, exp: exp}) do
    %{jwt: jwt,
    exp: exp}
  end
end
