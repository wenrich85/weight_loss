defmodule WeightLoss.Impl.Manager do
  alias WeightLoss.Impl.Calculate
  alias WeightLoss.Impl.Person

  defstruct ~w[person goal goals accomplishments start_date activity_level loss_rate]a

  def start, do: %__MODULE__{}

  def create_person(manager, person_details) do
    struct!(manager, person: Person.new(person_details, :imperial))
  end

  def add_target_weight(manager, goal) do
    struct!(manager, goal: goal)
  end

  def add_target_weight(manager, goal, :imperial) do
    metric_goal = 0.45359237 * goal
    add_target_weight(manager, metric_goal)
  end

  def set_activity_level(manager, activity_level) do
    struct!(manager, activity_level: activity_level)
  end

  def get_bmr(manager) do
    Calculate.bmr(manager.person)
  end

  def get_tdee_options(manager) do
    manager.person
    |> Calculate.bmr()
    |> Calculate.create_tdee_list()
  end

  def set_loss_rate(manager, rate) do
    manager
    |> struct!(loss_rate: rate)
  end

  def set_loss_rate_by_lbs(%{person: person}=manager, lbs) do
   struct!(manager, loss_rate: ((Calculate.lbs_to_kg(lbs) |> round())/person.weight) |> Float.round(2))
  end

  def set_start_date(manager, date) do
    struct!(manager, start_date: date)
  end

  def create_weekly_goals(%{person: person}=manager) do
    struct!(manager,
            goals: Calculate.create_goal_list(
              Calculate.kg_to_lbs(person.weight),
              manager.start_date,
              manager.loss_rate,
              Calculate.kg_to_lbs(manager.goal),
              []
            )
          )
  end

end
