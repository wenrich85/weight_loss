defmodule WeightLoss.Impl.CalorieProfile do
  alias WeightLoss.Impl.CalorieProfile
  defstruct ~w[maintenance_calories deficit]a

  @type t :: %__MODULE__{
    maintenance_calories: float(),
    deficit: float()
  }

  def new, do: %__MODULE__{}
  @spec new(map()) :: CalorieProfile.t()
  def new(%{maintenance_calories: maintenance_calories, deficit: deficit}) do
    %__MODULE__{
      maintenance_calories: maintenance_calories,
      deficit: deficit
    }
  end

  def daily_allowance(calorie_profile) do
    calorie_profile.maintenance_calories - calorie_profile.deficit
  end

  def weekly_maintenance_calories(cp) do
    cp.maintenance_calories * 7
  end


end
