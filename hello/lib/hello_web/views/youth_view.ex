defmodule HelloWeb.YouthView do
  use HelloWeb, :view
  alias Hello.Youth
  
  def name(%Youth{first_name: first_name, last_name: last_name}) do
    [first_name, last_name]
    |> Enum.join(" ")
  end
end
