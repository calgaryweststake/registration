defmodule Hello.Repo.Migrations.UpdateAdultTableAddRole do
  use Ecto.Migration

  def change do
    alter table(:adult) do
      add :role, :string
    end
  end
end
