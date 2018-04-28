defmodule HelloWeb.YouthAPIView do
  use HelloWeb, :view
  alias HelloWeb.YouthAPIView

  def render("index.json", %{youths: youths}) do
    %{data: render_many(youths, YouthAPIView, "youth.json", as: :youth)} # need `as: :youth` otherwise it is inferred as `youth_api` from the view name
  end

  def render("show.json", %{youth: youth}) do
    %{data: render_one(youth, YouthAPIView, "youth.json", as: :youth)}
  end

  def render("youth.json", %{youth: youth}) do
    %{id: youth.id,
    first_name: youth.first_name,
    last_name: youth.last_name,
    age: youth.age,
    gender: youth.gender,
    ward: youth.ward,
    photo: youth.photo.file_name}
  end
end
