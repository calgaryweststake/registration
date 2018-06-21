defmodule HelloWeb.YouthClosedController do
  use HelloWeb, :controller

  def new(conn, _params) do
    redirect conn, external: "/"
  end

end
