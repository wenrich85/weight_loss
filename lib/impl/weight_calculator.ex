defmodule WeightLoss.Impl.WeightCalculator do
  defstruct ~w[start current_weight goal_weight week weight_loss date]a

  def new(current_weight, goal_weight, date \\ Date.utc_today()) do
    %__MODULE__{
      start: current_weight,
      current_weight: current_weight,
      goal_weight: goal_weight,
      week: 0,
      weight_loss: 0,
      date: date
    }
  end

  def weight_calc(weight_tracker, week_container \\ [])
  def weight_calc(%{current_weight: current_weight, goal_weight: goal_weight}=weight_tracker, week_container) when current_weight > goal_weight do
    divisible_by_8?(weight_tracker.week)
    IO.puts("#{color(weight_tracker.current_weight)}#{Date.to_string(weight_tracker.date)} | Current weight is #{weight_tracker.current_weight} week: #{weight_tracker.week} | lbs lost this week: #{weight_tracker.weight_loss} total loss so far #{weight_tracker.start - weight_tracker.current_weight}")
    new_tracker = struct(
                      weight_tracker,
                      [
                        weight_loss: calc_weight_loss(weight_tracker.current_weight),
                        week: weight_tracker.week + 1,
                        current_weight: weight_tracker.current_weight - calc_weight_loss(weight_tracker.current_weight),
                        date: Date.add(weight_tracker.date, 7)
                      ]
                      )
    new_week_container = [ new_tracker | week_container ]

    weight_calc(new_tracker, new_week_container)

  end

  def weight_calc(weight_tracker, week_container ) do
    IO.puts("#{color(weight_tracker.current_weight)}Current weight is #{weight_tracker.current_weight} week: #{weight_tracker.week} lbs lost this week: #{weight_tracker.weight_loss}")
    IO.puts("#{IO.ANSI.green()}You can expect to lose #{weight_tracker.start - weight_tracker.goal_weight} by #{Date.to_string(weight_tracker.date)}")
    week_container
  end

  defp calc_weight_loss(weight) when weight > 200 do
    weight * 0.015
    |> Float.round()
  end

  defp calc_weight_loss(weight) do
    weight * 0.01
    |> Float.round()
  end

  defp color(weight) when weight > 220 do
    IO.ANSI.red()
  end

  defp color(weight) when weight > 200 do
    IO.ANSI.yellow()
  end

  defp color(weight) when weight > 150 do
    IO.ANSI.blue()
  end

  defp color(_weight) do
    IO.ANSI.green()
  end

  defp divisible_by_8?(week) do
    case rem(week, 8) do
      0 ->
        IO.puts("#{IO.ANSI.white_background()} Start a new workout #{IO.ANSI.reset()}")
      _ ->
        nil
    end
  end
end
