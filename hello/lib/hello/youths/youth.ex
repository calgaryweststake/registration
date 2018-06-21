defmodule Hello.Youths.Youth do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset
  alias Hello.Youths.Youth

  schema "youth" do
    ## Youth Personal
    field :first_name, :string
    field :last_name, :string
    field :tribe, :string
    field :mobile_number, :string
    field :birth_date, :date
    field :age, :integer
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
    |> cast(attrs, [:first_name, :last_name, :tribe, :mobile_number, :birth_date, :gender, :ward, :emergency_first_name, :emergency_last_name, :emergency_primary_number, :emergency_alternate_number, :emergency_relationship, :alberta_health_care, :medical_allergies, :medical_limitations, :medical_medications, :medical_history, :permission_first_name, :permission_last_name, :permission_email, :permission_number, :permission_address, :permission_city, :permission_province, :permission_participation_agreement, :permission_photographic_agreement])
    |> cast_attachments(attrs, [:photo])
    |> validate_required([:first_name, :last_name, :birth_date, :gender, :ward, :photo, :emergency_first_name, :emergency_last_name, :emergency_primary_number, :emergency_relationship, :alberta_health_care, :permission_first_name, :permission_last_name, :permission_number, :permission_address, :permission_city, :permission_province])
    |> calculate_age(:birth_date)
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:last_name, min: 2, max: 30)
    |> validate_length(:mobile_number, min: 10, max: 30)
    |> validate_length(:gender, min: 3, max: 30)
    |> validate_length(:ward, min: 3, max: 30)
    |> validate_length(:emergency_first_name, min: 2, max: 30)
    |> validate_length(:emergency_last_name, min: 2, max: 30)
    |> validate_length(:emergency_primary_number, min: 10, max: 30)
    |> validate_length(:emergency_relationship, min: 3, max: 30)
    |> validate_length(:permission_first_name, min: 2, max: 30)
    |> validate_length(:permission_last_name, min: 2, max: 30)
    |> validate_format(:permission_email, ~r/@/)
    |> validate_length(:permission_number, min: 10, max: 30)
    |> validate_length(:permission_address, min: 2, max: 60)
    |> validate_length(:permission_city, min: 2, max: 30)
    |> validate_length(:permission_province, min: 2, max: 30)
    |> validate_acceptance(:permission_participation_agreement, message: "In order for a youth to participate a Parent/Guardian must agree.")
  end

  @doc false
  defp calc_diff({y1, m1, d1}, {y2, m2, d2}) when m2 > m1 or (m2 == m1 and d2 >= d1) do
    y2 - y1
  end
  defp calc_diff({y1,_,_}, {y2,_,_}), do: (y2 - y1) - 1

  defp calculate_age(%Ecto.Changeset{} = changeset, field) do
    with %Date{} = date_val <- get_field(changeset, field),
         %Date{} = start_val <- ~D[2018-06-29] # start of event
    do
      changeset
      |> put_change(:age, calc_diff(Date.to_erl(date_val), Date.to_erl(start_val)))
    else
      _-> changeset
    end
  end
end
