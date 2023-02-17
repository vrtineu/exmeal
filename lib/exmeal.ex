defmodule Exmeal do
  alias Exmeal.Meals.Create, as: CreateMeal
  alias Exmeal.Meals.Delete, as: DeleteMeal
  alias Exmeal.Meals.Get, as: GetMeal
  alias Exmeal.Meals.Update, as: UpdateMeal

  defdelegate create_meal(attrs), to: CreateMeal, as: :call
  defdelegate delete_meal(attrs), to: DeleteMeal, as: :call
  defdelegate get_meal_by_id(attrs), to: GetMeal, as: :by_id
  defdelegate update_meal(attrs), to: UpdateMeal, as: :call
end
