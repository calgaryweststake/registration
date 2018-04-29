defmodule HelloWeb.YouthAPIView do
  use HelloWeb, :view
  alias HelloWeb.YouthAPIView
  alias Hello.Photo

  def render("index.json", %{youths: youths}) do
    %{youth: render_many(youths, YouthAPIView, "youth.json", as: :youth)} # need `as: :youth` otherwise it is inferred as `youth_api` from the view name
  end

  def render("show.json", %{youth: youth}) do
    %{youth: render_one(youth, YouthAPIView, "youth.json", as: :youth)}
  end

  def render("youth.json", %{youth: youth}) do
    %{id: youth.id,
    first_name: youth.first_name,
    last_name: youth.last_name,
    age: youth.age,
    gender: youth.gender,
    ward: youth.ward,
    photo: "#{youth.first_name}_#{youth.last_name}_#{youth.ward}_original_#{youth.photo.file_name}"} # # "#{scope.first_name}_#{scope.last_name}_#{scope.ward}_#{version}_#{file_name}"
  end
end
