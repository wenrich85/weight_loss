defmodule WeightLoss.WeightGoalTest do
  alias WeightLoss.Impl.WeightGoal
  use ExUnit.Case

  doctest(WeightGoal)

  setup  do
    %{goal_details: %{goal_weight: 155, percentage_to_lose_weekly: 1.5, start_date: Date.utc_today(), percentage_from_calories: 50, }}
  end
  test "returns a weight_goal struct", %{goal_details: details} do
    assert %WeightGoal{} == WeightGoal.new()
    wg = WeightGoal.new(details)
    assert details.goal_weight == wg.goal_weight

  end


  test "returns updadted weight struct", %{goal_details: details} do
    wg = WeightGoal.new(details) |> WeightGoal.calculate_weekly_deficit(240)
    assert wg.weekly_deficit_required == 14000
  end
end
