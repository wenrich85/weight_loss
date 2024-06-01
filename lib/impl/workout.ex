defmodule WeightLoss.Impl.Workout do

  defstruct ~w[chest legs back arms core cardio]a

  def new() do
    %__MODULE__{}
  end
end
