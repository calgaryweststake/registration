defmodule Hello.Repo.Migrations.UpdateYouthTableAddTribe do
  use Ecto.Migration

  def change do
    alter table(:youth) do
      add :tribe, :string
    end
  end
end
