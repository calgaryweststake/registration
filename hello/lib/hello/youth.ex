defmodule Hello.Youth do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Youth


  schema "youth" do
    field :email, :string
    field :name, :string
    field :bio, :string

    timestamps()
  end

  @doc false
  def changeset(%Youth{} = youth, attrs \\ %{}) do
    youth
    |> cast(attrs, [:name, :email, :bio])
    |> validate_required([:name, :email, :bio])
    |> validate_length(:name, min: 5, max: 20) # for example
  end
end
