defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

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
      |> render("show.json", meal: meal)
    end
  end
end
