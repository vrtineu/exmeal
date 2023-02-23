defmodule Exmeal do
  defdelegate create_meal(attrs), to: Exmeal.Meals.Create, as: :call
  defdelegate delete_meal(attrs), to: Exmeal.Meals.Delete, as: :call
  defdelegate get_meal_by_id(attrs), to: Exmeal.Meals.Get, as: :by_id
  defdelegate update_meal(attrs), to: Exmeal.Meals.Update, as: :call

  defdelegate create_user(attrs), to: Exmeal.Users.Create, as: :call
  defdelegate get_user_by_id(attrs), to: Exmeal.Users.Get, as: :by_id
  defdelegate delete_user(attrs), to: Exmeal.Users.Delete, as: :call
end
