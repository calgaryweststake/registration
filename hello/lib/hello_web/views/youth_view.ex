defmodule HelloWeb.YouthView do
  use HelloWeb, :view
  alias Hello.Youth
  
  def first_name(%Youth{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
