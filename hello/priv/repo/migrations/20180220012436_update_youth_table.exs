defmodule Hello.Repo.Migrations.UpdateYouthTable do
  use Ecto.Migration

  def change do
    alter table(:youth) do
      add :bio, :string
    end
  end
end
