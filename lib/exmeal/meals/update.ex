defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{"id" => id} = attrs) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.new_not_found_meal()}
      meal -> update_meal(meal, attrs)
    end
  end

  defp update_meal(meal, attrs) do
    meal = Meal.changeset(meal, attrs)
    Repo.update(meal)
  end
end
