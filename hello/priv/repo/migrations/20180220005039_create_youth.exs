defmodule Hello.Repo.Migrations.CreateYouth do
  use Ecto.Migration

  def change do
    create table(:youth) do
      
      ## Youth Personal
      add :first_name, :string
      add :last_name, :string
      add :mobile_number, :string
      add :birth_date, :date
      # gender
      # ward

      ## Emergency Contact
      add :emergency_first_name, :string
      add :emergency_last_name, :string
      add :emergency_primary_number, :string
      add :emergency_alternate_number, :string
      add :emergency_relationship, :string
  
      ## Medical Information
      add :medical_allergies, :string
      add :medical_limitations, :string
      add :medical_medications, :string
      add :medical_history, :string
  
      ## Permission
      add :permission_first_name, :string
      add :permission_last_name, :string
      add :permission_email, :string
      add :permission_number, :string
      add :permission_address, :string
      add :permission_city, :string
      add :permission_province, :string
      
      add :permission_participation_agreement, :string
      add :permission_photographic_agreement, :string
  
      timestamps()
    end

  end
end
