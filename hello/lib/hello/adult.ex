defmodule Hello.Adult do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset
  alias Hello.Adult

  schema "adult" do
    ## Adult Personal
    field :first_name, :string
    field :last_name, :string
    field :role, :string
    field :mobile_number, :string
    field :email, :string
    field :gender, :string
    field :ward, :string
    field :photo, Hello.Photo.Type

    ## Emergency Contact
    field :emergency_first_name, :string
    field :emergency_last_name, :string
    field :emergency_primary_number, :string
    field :emergency_alternate_number, :string
    field :emergency_relationship, :string

    ## Medical Information
    field :alberta_health_care, :string
    field :medical_allergies, :string
    field :medical_limitations, :string
    field :medical_medications, :string
    field :medical_history, :string

    field :permission_photographic_agreement, :string

    timestamps()
  end

  @doc false
  def changeset(%Adult{} = adult, attrs \\ %{}) do

    adult
    |> cast(attrs, [:first_name, :last_name, :role, :mobile_number, :email, :gender, :ward, :emergency_first_name, :emergency_last_name, :emergency_primary_number, :emergency_alternate_number, :emergency_relationship, :alberta_health_care, :medical_allergies, :medical_limitations, :medical_medications, :medical_history, :permission_photographic_agreement])
    |> cast_attachments(attrs, [:photo])
    |> validate_required([:first_name, :last_name, :role, :email, :gender, :ward, :photo, :emergency_first_name, :emergency_last_name, :emergency_primary_number, :emergency_relationship, :alberta_health_care])
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:last_name, min: 2, max: 30)
    |> validate_length(:mobile_number, min: 10, max: 30)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:gender, min: 3, max: 30)
    |> validate_length(:ward, min: 3, max: 30)
    |> validate_length(:emergency_first_name, min: 2, max: 30)
    |> validate_length(:emergency_last_name, min: 2, max: 30)
    |> validate_length(:emergency_primary_number, min: 10, max: 30)
    |> validate_length(:emergency_relationship, min: 3, max: 30)
  end
end
