defmodule HelloWeb.AdultController do
  use HelloWeb, :controller
  alias Hello.Repo
  alias Hello.Adult

  def index(conn, _params) do
    adult = Repo.all(Adult)
    render conn, "index.html", adult: adult
  end

  def show(conn, %{"id" => id}) do
    adult = Repo.get(Adult, id)
    render conn, "show.html", adult: adult
  end

  def new(conn, _params) do
    changeset = Adult.changeset(%Adult{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"adult" => adult_params}) do
    changeset = Adult.changeset(%Adult{}, adult_params)
    case Repo.insert(changeset) do
      {:ok, adult} ->
        conn
        |> put_flash(:info, "The registration for #{adult.first_name} #{adult.last_name} has been successfully submitted!")
        |> redirect(to: adult_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
