defmodule WeightLoss.WeeklyGoalTest do
  alias WeightLoss.Impl.WeeklyGoal
  use ExUnit.Case

  doctest(WeeklyGoal)

  setup do
    %{goal_details: %{previous_weight: 240, weight_to_lose: 4, end_of_week_date: ~D[2024-06-08]}}
  end

  test "create weekly_goal struct", %{goal_details: goal_details} do
    assert WeeklyGoal.new(goal_details).previous_weight == 240
    assert WeeklyGoal.new(goal_details).weight_goal == 236

  end
end
