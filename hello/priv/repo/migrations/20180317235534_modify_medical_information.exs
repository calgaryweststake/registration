defmodule Hello.Repo.Migrations.ModifyMedicalInformation do
  use Ecto.Migration

  def change do
    alter table(:youth) do
      modify :medical_allergies, :text
      modify :medical_limitations, :text
      modify :medical_medications, :text
      modify :medical_history, :text
    end

  end
end
