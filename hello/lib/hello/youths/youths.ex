defmodule Hello.Youths do
  @moduledoc """
  The Youths context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Youths.Youth

  @doc """
  Returns the list of youths.

  ## Examples

      iex> list_youths()
      [%Youth{}, ...]

  """
  def list_youths do
    Repo.all(Youth)
  end

  @doc """
  Gets a single youth.

  Raises `Ecto.NoResultsError` if the Youth does not exist.

  ## Examples

      iex> get_youth!(123)
      %Youth{}

      iex> get_youth!(456)
      ** (Ecto.NoResultsError)

  """
  def get_youth!(id), do: Repo.get!(Youth, id)

  @doc """
  Creates a youth.

  ## Examples

      iex> create_youth(%{field: value})
      {:ok, %Youth{}}

      iex> create_youth(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_youth(attrs \\ %{}) do
    %Youth{}
    |> Youth.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a youth.

  ## Examples

      iex> update_youth(youth, %{field: new_value})
      {:ok, %Youth{}}

      iex> update_youth(youth, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_youth(%Youth{} = youth, attrs) do
    youth
    |> Youth.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Youth.

  ## Examples

      iex> delete_youth(youth)
      {:ok, %Youth{}}

      iex> delete_youth(youth)
      {:error, %Ecto.Changeset{}}

  """
  def delete_youth(%Youth{} = youth) do
    Repo.delete(youth)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking youth changes.

  ## Examples

      iex> change_youth(youth)
      %Ecto.Changeset{source: %Youth{}}

  """
  def change_youth(%Youth{} = youth) do
    Youth.changeset(youth, %{})
  end
end
