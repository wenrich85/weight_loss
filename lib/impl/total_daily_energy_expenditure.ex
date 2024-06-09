defmodule WeightLoss.Impl.TotalDailyEnergyExpenditure do
  defstruct ~w[title calories description]a

  @definitions %{
    sedentary: %{multiplier: 1.2, description: "You get little or no exercise."},
    lightly_active: %{multiplier: 1.375, description: "You exercise 1-3 times a week."},
    moderately_active: %{multiplier: 1.55, description: "You exercise 4-5 times a week."},
    very_active: %{multiplier: 1.725, description: "You exercise daily or intense exercise 3-4 times a week."},
    super_active: %{multiplier: 1.9, description: "You exercise intensly everyday or you have a very physical job."}
  }

  def new(%{title: title, calories: calories} ) do
    %__MODULE__{
      title: title,
      calories: calories,
      description: @definitions[title |> String.to_atom][:description]
    }
  end

  def create_tdee_list(bmr) do
    Map.keys(@definitions)
    |> Enum.map(fn title -> new(%{title: title |> to_string, calories: @definitions[title][:multiplier] * bmr})end)
  end
end
