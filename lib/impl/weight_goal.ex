defmodule WeightLoss.Impl.WeightGoal do
  alias WeightLoss.Impl.WeightGoal
  defstruct ~w[goal_weight percentage_to_lose_weekly percentage_from_calories start_date weekly_deficit_required]a

  @type t :: %__MODULE__ {
    goal_weight: float(),
    percentage_to_lose_weekly: float(),
    percentage_from_calories: float(),
    start_date: Date.t(),
    weekly_deficit_required: integer()
  }

  @caloric_pound 3500

  def new, do: %__MODULE__{}
  @spec new(map()) :: WeightGoal.t()
  def new(%{goal_weight: weight, percentage_to_lose_weekly: wk_percent, percentage_from_calories: cal_percent, start_date: date}) do
    %__MODULE__{
      goal_weight: weight,
      percentage_to_lose_weekly: wk_percent/100,
      percentage_from_calories: cal_percent/100,
      start_date: date,
    }
  end

  def calculate_weekly_deficit(%{percentage_to_lose_weekly: wk_percent}=weight_goal, current_weight) do
    struct!(weight_goal, weekly_deficit_required: get_weekly_lbs_lost(wk_percent, current_weight) * @caloric_pound)
  end

  defp get_weekly_lbs_lost(wk_percent, current_weight) do
    current_weight * wk_percent
    |> Float.ceil()
  end


end
