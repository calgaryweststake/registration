defmodule Hello.Repo.Migrations.UpdateYouthTableAddAge do
  use Ecto.Migration

  def change do
    alter table(:youth) do
      add :age, :integer
    end
  end
end
