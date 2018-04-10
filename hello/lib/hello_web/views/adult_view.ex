defmodule HelloWeb.AdultView do
  use HelloWeb, :view
  alias Hello.Adult

  def name(%Adult{first_name: first_name, last_name: last_name}) do
    [first_name, last_name]
    |> Enum.join(" ")
  end

  def abbreviated_allergies(%Adult{medical_allergies: medical_allergies}) do
    cond do
      medical_allergies == nil ->
        ""
      true ->
        medical_allergies
        |> String.slice(0..29)
        |> Kernel.<>("…")
    end
  end

  def abbreviated_limitations(%Adult{medical_limitations: medical_limitations}) do
    cond do
      medical_limitations == nil ->
        ""
      true ->
        medical_limitations
        |> String.slice(0..29)
        |> Kernel.<>("…")
    end
  end

  def abbreviated_medications(%Adult{medical_medications: medical_medications}) do
    cond do
      medical_medications == nil ->
        ""
      true ->
        medical_medications
        |> String.slice(0..29)
        |> Kernel.<>("…")
      end
  end

  def abbreviated_history(%Adult{medical_history: medical_history}) do
    cond do
      medical_history == nil ->
        ""
      true ->
        medical_history
        |> String.slice(0..29)
        |> Kernel.<>("…")
    end
  end

end
