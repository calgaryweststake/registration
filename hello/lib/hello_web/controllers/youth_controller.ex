defmodule HelloWeb.YouthController do
  use HelloWeb, :controller
  alias Hello.Repo
  alias Hello.Youth

  def index(conn, _params) do
    youth = Repo.all(Youth)
    render conn, "index.html", youth: youth
  end

  def show(conn, %{"id" => id}) do
    youth = Repo.get(Youth, id)
    render conn, "show.html", youth: youth
  end

  def new(conn, _params) do
    changeset = Youth.changeset(%Youth{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"youth" => youth_params}) do
    changeset = Youth.changeset(%Youth{}, youth_params)
    case Repo.insert(changeset) do
      {:ok, youth} ->
        conn
        |> put_flash(:info, "The registration for #{youth.first_name} #{youth.last_name} has been successfully submitted!")
        |> redirect(to: youth_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
