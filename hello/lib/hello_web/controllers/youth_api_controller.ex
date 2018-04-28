defmodule HelloWeb.YouthAPIController do
  use HelloWeb, :controller

  alias Hello.Youths
  alias Hello.Youths.Youth

  action_fallback HelloWeb.FallbackController

  def index(conn, _params) do
    youths = Youths.list_youths()
    render(conn, "index.json", youths: youths)
  end

  def create(conn, %{"youth" => youth_params}) do
    with {:ok, %Youth{} = youth} <- Youths.create_youth(youth_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", youth_path(conn, :show, youth))
      |> render("show.json", youth: youth)
    end
  end

  def show(conn, %{"id" => id}) do
    youth = Youths.get_youth!(id)
    render(conn, "show.json", youth: youth)
  end

  def update(conn, %{"id" => id, "youth" => youth_params}) do
    youth = Youths.get_youth!(id)

    with {:ok, %Youth{} = youth} <- Youths.update_youth(youth, youth_params) do
      render(conn, "show.json", youth: youth)
    end
  end

  def delete(conn, %{"id" => id}) do
    youth = Youths.get_youth!(id)
    with {:ok, %Youth{}} <- Youths.delete_youth(youth) do
      send_resp(conn, :no_content, "")
    end
  end
end
