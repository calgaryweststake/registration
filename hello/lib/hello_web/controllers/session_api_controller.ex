defmodule HelloWeb.SessionAPIController do
  use HelloWeb, :controller

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    ## Authenticate (confirm credentials)
    case Hello.Auth.authenticate_user(username, password) do
      {:ok, user} ->

        {_, jwt, claims} = Hello.Auth.Guardian.encode_and_sign(user) # need to deal with :ok or :error
        exp = Map.get(claims, "exp")
        # check claim for access?
        # https://tools.ietf.org/html/rfc7519#section-4.1
        conn
        |> render("login.json", user: user, jwt: jwt, exp: exp)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Invalid username/password combination")
    end
  end

  def delete(conn, _) do
    conn
    |> Hello.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
