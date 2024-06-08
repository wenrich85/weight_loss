defmodule WeightLoss.PersonTest do
  alias WeightLoss.Impl.Person
  use ExUnit.Case
  import WeightLoss.Impl.Person
   doctest Person

   setup do
    %{person_details: %{name: "Wendell Richards", dob: ~D[1985-09-16], weight: 240, height: 67, gender: 'm'}}
   end

   test "creates a new person", %{person_details: person_details} do
     assert %Person{} == Person.new()


     person = Person.new(person_details)

     assert person.name == person_details.name
     assert person.dob == person_details.dob
     assert person.weight == person_details.weight
     assert person.height == person_details.height
     assert person.gender == person_details.gender
   end

   test "get age when given a person", %{person_details: person_details} do
      person = Person.new(person_details)
      age =
        Date.diff(Date.utc_today(), person.dob)
        |> div(365)

      assert age == Person.age(person)
    end

    test "converts person with imperial data to metric data", %{person_details: person_details} do
      person = Person.new(person_details, :imperial)

      assert person.weight == person_details.weight * 0.45359237
      assert person.height == person_details.height * 2.54
    end

end
