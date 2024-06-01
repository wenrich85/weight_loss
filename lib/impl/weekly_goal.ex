defmodule WeightLoss.Impl.WeeklyGoal do
  alias WeightLoss.Impl.WeeklyGoal
  defstruct ~w[previous_weight weight_to_lose end_of_week_date weight_goal]a

  @type t :: %__MODULE__{
    previous_weight: float(),
    weight_to_lose: integer(),
    end_of_week_date: Date.t(),
    weight_goal: float()

  }

  @spec new(map()) :: WeeklyGoal.t()
  def new(%{previous_weight: pw, weight_to_lose: lose, end_of_week_date: ewd}) do
    %__MODULE__{
      previous_weight: pw,
      weight_to_lose: lose,
      end_of_week_date: ewd,
      weight_goal: pw - lose
    }
  end
end
