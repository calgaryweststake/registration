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
end
