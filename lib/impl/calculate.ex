defmodule WeightLoss.Impl.Calculate do

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

  def create_tdee_map(bmr) do
    %{
      sedentary: bmr * 1.2 ,
      lightly_active: bmr * 1.375,
      moderately_active: bmr * 1.55,
      very_active: bmr * 1.725,
      super_active: bmr * 1.9
    }
  end


  defp age_calculator(age, date\\ Date.utc_today()) do
    Date.diff(date, age)
  end
end
