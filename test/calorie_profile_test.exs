defmodule WeightLoss.CalorieProfileTest do
  alias WeightLoss.Impl.CalorieProfile
  use ExUnit.Case

  setup do
    %{cal_details: %{maintenance_calories: 3000, deficit: 1000}}
  end

  doctest WeightLoss.Impl.CalorieProfile

  test "create a new calorie profile", %{cal_details: details} do
    assert %CalorieProfile{} == CalorieProfile.new

    cp = CalorieProfile.new(details)

    assert cp.maintenance_calories == details.maintenance_calories
    assert cp.deficit == details.deficit
  end

  test "calculate calorie allowance", %{cal_details: details} do
    cp = CalorieProfile.new(details)

    assert details.maintenance_calories - details.deficit == CalorieProfile.daily_allowance(cp)
    assert details.maintenance_calories * 7 == CalorieProfile.weekly_maintenance_calories(cp)
  end
end
