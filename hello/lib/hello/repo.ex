defmodule Hello.Repo do
  use Ecto.Repo, otp_app: :hello
  use Scrivener, page_size: 10

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end

# defmodule Hello.Repo do
#   @doc """
#   In memory repository.
#   """
#
#   def all(Hello.Youth) do
#     [%Hello.Youth{id: "1", name: "Stan", username: "stanislav", password: "elixir"},
#     %Hello.Youth{id: "2", name: "Phil", username: "philislav", password: "phoenix"},
#     %Hello.Youth{id: "3", name: "Leo", username: "leoislav", password: "erlang"}
#     ]
#   end
#
#   def all(_module), do: []
#
#     def get(module, id) do
#       Enum.find all(module), fn map -> map.id == id end
#     end
#
#     def get_by(module, params) do
#       Enum.find all(module), fn map ->
#         Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
#     end
#
#   end
# end
