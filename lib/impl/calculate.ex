defmodule WeightLoss.Impl.Calculate do
alias WeightLoss.Impl.Milestone
alias WeightLoss.Impl.TotalDailyEnergyExpenditure

@kg_multiplier 0.45359237
@lbs_multiplier 2.2

  def bmr(%{weight: weight_in_kg, height: height_in_cm, gender: ~c"m"}=person) do
    88.362 + (13.397 * weight_in_kg) + (4.799 * height_in_cm) - (5.677 * age_calculator(person.dob))
    |> Float.ceil()
    |> IO.inspect()
  end

  def bmr(%{weight: weight_in_kg, height: height_in_cm, gender: ~c"f"}=person) do
    447.593 + (9.24 * weight_in_kg) + (3.098 * height_in_cm) - (4.330 * age_calculator(person.dob))
    |> Float.ceil()
    |> IO.inspect()
  end

  def create_tdee_list(bmr) do
    TotalDailyEnergyExpenditure.create_tdee_list(bmr)
  end

  def lbs_to_kg(lbs) do
    @kg_multiplier * lbs
  end

  def kg_to_lbs(kg) do
    @lbs_multiplier * kg
  end

  def create_goal_list(starting_weight, _start_date, _loss_rate, goal, milestones)
    when goal >= starting_weight do
      milestones
  end

  def create_goal_list(starting_weight, start_date, loss_rate, goal, milestones) do
    milestone = Milestone.new(%{starting_weight: starting_weight, losing_weight: starting_weight * loss_rate, deadline: Date.add(start_date, 7)})
    |> IO.inspect()
    milestone_list = [ milestone | milestones]
    create_goal_list(milestone.goal_weight, milestone.deadline, loss_rate, goal, milestone_list)
  end


  defp age_calculator(age, date\\ Date.utc_today()) do
    Date.diff(date, age)
    |> div(365)
  end
end
