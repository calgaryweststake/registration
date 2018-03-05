defmodule Hello.Youth do
  use Ecto.Schema

  import Ecto.Changeset
  alias Hello.Youth


  schema "youth" do
    ## Youth Personal
    # solo selfie\
    field :first_name, :string
    field :last_name, :string
    field :mobile_number, :string
    field :birth_date, :date
    field :gender, :string
    field :ward, :string
    
    ## Emergency Contact
    field :emergency_first_name, :string
    field :emergency_last_name, :string
    field :emergency_primary_number, :string
    field :emergency_alternate_number, :string
    field :emergency_relationship, :string
    
    ## Medical Information
    field :medical_allergies, :string
    field :medical_limitations, :string
    field :medical_medications, :string
    field :medical_history, :string
    
    ## Permission
    field :permission_first_name, :string
    field :permission_last_name, :string
    field :permission_email, :string
    field :permission_number, :string
    field :permission_address, :string
    field :permission_city, :string
    field :permission_province, :string
    
    field :permission_participation_agreement, :string
    field :permission_photographic_agreement, :string

    timestamps()
  end

  @doc false
  def changeset(%Youth{} = youth, attrs \\ %{}) do

    youth
    |> cast(attrs, [:first_name, :last_name, :birth_date, :gender, :ward])
    |> validate_required([:first_name, :last_name, :birth_date, :gender, :ward])
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:last_name, min: 2, max: 30)
    |> validate_length(:gender, min: 3, max: 30)
    |> validate_length(:ward, min: 3, max: 30)
  end
end
