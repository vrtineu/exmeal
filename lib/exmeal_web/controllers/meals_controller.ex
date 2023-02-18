defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal

  action_fallback(ExmealWeb.FallbackController)

  def create(conn, attrs) do
    with {:ok, meal} <- Exmeal.create_meal(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Exmeal.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, attrs) do
    with {:ok, %Meal{} = meal} <- Exmeal.update_meal(attrs) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end
end
