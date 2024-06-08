defmodule WeightLoss do
alias WeightLoss.Impl.Calculate
alias WeightLoss.Impl.Person

  def create_person(person, system) do
    Person.new(person, system)
  end

  def calculate_bmr(person) do
    WeightLoss.Impl.Calculate.bmr(person)
  end

  def calculater_tdee(bmr) do
    Calculate.create_tdee_map(bmr)
  end
  def recurse(number, list, goal, step) when number >= goal do
    list = [number | list]
    recurse(number - step, list, goal, step)
  end

  def recurse(_, list, _, _) do
    {length(list), list}
  end

end
