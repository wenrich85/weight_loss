defmodule WeightLoss.Impl.Person do
  alias WeightLoss.Impl.Person
  defstruct ~w[name dob height weight gender]a
  @type t :: %Person{
    name: String.t(),
    dob: Date.t(),
    height: float(),
    weight: float(),
    gender: char()
  }
  def new, do: %__MODULE__{}

  @spec new(map()) :: Person.t()
  def new(%{name: name, dob: dob, height: height, weight: weight, gender: gender}) do
    %__MODULE__{
      name: name,
      dob: dob,
      height: height,
      weight: weight,
      gender: gender
    }
  end

  @spec age(Person.t()) :: integer
  def age(%{dob: dob}=_person) do
    Date.diff(Date.utc_today(), dob)
    |> div(365)
  end

end
