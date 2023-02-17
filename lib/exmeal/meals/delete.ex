defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Error, Repo}

  def call(id) do
    case Repo.get(Exmeal.Meal, id) do
      nil -> {:error, Error.new("Meal not found", :not_found)}
      meal -> Repo.delete(meal)
    end
  end
end
