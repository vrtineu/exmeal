defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) do
    with %Meal{} = meal <- Repo.get(Meal, id) do
      {:ok, meal}
    else
      nil -> {:error, Error.new("Meal not found", :not_found)}
    end
  end
end
