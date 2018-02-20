defmodule Hello.Repo.Migrations.CreateYouth do
  use Ecto.Migration

  def change do
    create table(:youth) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
