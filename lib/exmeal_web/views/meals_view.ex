defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view
  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created successfully",
      data: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal fetched successfully",
      data: meal
    }
  end

  def render("update.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal updated successfully",
      data: meal
    }
  end
end
