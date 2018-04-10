defmodule Hello.Repo.Migrations.CreateAdult do
  use Ecto.Migration

  def change do
    create table(:adult) do

      ## Adult Personal
      add :first_name, :string
      add :last_name, :string
      add :mobile_number, :string
      add :email, :string
      add :gender, :string
      add :ward, :string
      add :photo, :string

      ## Emergency Contact
      add :emergency_first_name, :string
      add :emergency_last_name, :string
      add :emergency_primary_number, :string
      add :emergency_alternate_number, :string
      add :emergency_relationship, :string

      ## Medical Information
      add :alberta_health_care, :string
      add :medical_allergies, :text
      add :medical_limitations, :text
      add :medical_medications, :text
      add :medical_history, :text

      ## Permission
      add :permission_photographic_agreement, :string

      timestamps()
    end

  end
end
