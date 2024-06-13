defmodule WeightLoss.Impl.Milestone do
  defstruct ~w[starting_weight losing_weight goal_weight deadline]a

  def new(%{starting_weight: start, losing_weight: loss, deadline: deadline}) do
    %__MODULE__{
      starting_weight: round(start),
      losing_weight: round(loss),
      goal_weight: round(start - loss),
      deadline: deadline
    }
  end

end
