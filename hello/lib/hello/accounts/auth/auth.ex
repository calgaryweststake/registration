defmodule Hello.Auth do
  @moduledoc false

  require Ecto.Query

  import Plug.Conn

  alias Hello.Auth.Guardian
  alias Comeonin.Bcrypt
  alias Hello.Accounts.User
  alias Hello.Repo

  def authenticate_user(username, given_password) do
    query = Ecto.Query.from(u in User, where: u.username == ^username)

    Repo.one(query)
    |> check_password(given_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, given_password) do
    case Bcrypt.checkpw(given_password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user) ## This line generates the JWT, stores it in the session (and on the assigns) and proceeds. At this point, you're “logged in”.
    |> assign(:current_user, user)
    |> put_user_token(user)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end

  def load_current_user(conn, _) do
    conn
    |> assign(:current_user, Guardian.Plug.current_resource(conn))
    |> put_user_token(Guardian.Plug.current_resource(conn))
  end

  defp put_user_token(conn, user) do
    token = Phoenix.Token.sign(conn, "user socket", user.id)

    conn
    |> assign(:user_token, token)
  end
end
