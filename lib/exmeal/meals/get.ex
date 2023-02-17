defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) do
    with %Meal{} = meal <- Repo.get(Meal, id) do
      {:ok, meal}
    else
      nil -> {:error, Error.new_not_found_meal()}
    end
  end
end
