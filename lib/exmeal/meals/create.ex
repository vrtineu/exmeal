defmodule Exmeal.Meals.Create do
  alias Ecto.Changeset

  alias Exmeal.{Meal, Repo}

  def call(attrs \\ %{}) do
    attrs
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_result()
  end

  defp handle_result({:ok, %Meal{}} = result), do: result

  defp handle_result({:error, %Changeset{}} = result) do
    {:error, result}
  end
end
