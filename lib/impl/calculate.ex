defmodule WeightLoss.Impl.Calculate do
alias WeightLoss.Impl.TotalDailyEnergyExpenditure

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


  defp age_calculator(age, date\\ Date.utc_today()) do
    Date.diff(date, age)
    |> div(365)
  end
end
