defmodule Hello.Repo.Migrations.UpdateYouthTableAddAlbertaHealthCare do
  use Ecto.Migration

  def change do
    alter table(:youth) do
      add :alberta_health_care, :string
    end
  end
end
