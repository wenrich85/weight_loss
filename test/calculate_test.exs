defmodule CalculateTest do
  alias WeightLoss.Impl.{Person, Calculate}
  use ExUnit.Case

  doctest Calculate

   setup do
    %{person_details: %{name: "Wendell Richards", dob: ~D[1985-09-16], weight: 240, height: 67, gender: 'm'}}
   end

  test "returns bmr calculation", %{person_details: person_details} do
    person = Person.new(person_details, :imperial)
    assert Calculate.bmr(person) != nil
  end

end
