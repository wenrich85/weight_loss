defmodule WeightLoss do
alias WeightLoss.Impl.Manager

  def create_person(person) do
    Manager.start()
    |>Manager.create_person(person)
  end

  def calculate_bmr(manager) do
    Manager.get_bmr(manager)
  end

  def get_tdee_options(manager) do
    Manager.get_tdee_options(manager)
  end

  def set_goal_weight(manager, goal_weight) do
    Manager.add_target_weight( manager, goal_weight, :imperial)
  end

  def set_activity_level(manager, activity_level \\ :sedentary) do
    Manager.set_activity_level(manager, activity_level)
  end

  def set_loss_rate_by_lbs(manager, loss_rate) do
    Manager.set_loss_rate_by_lbs(manager, loss_rate)
  end

  def set_loss_rate(manager, loss_rate) do
    Manager.set_loss_rate(manager, loss_rate)
  end

  def set_start_date(manager, start_date \\ Date.utc_today()) do
    Manager.set_start_date(manager, start_date)
  end

  def get_loss_schedule(manager) do
    Manager.create_weekly_goals(manager)
  end
end
