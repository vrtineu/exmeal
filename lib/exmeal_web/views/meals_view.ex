defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view
  alias Exmeal.Meal

  def render("show.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created successfully",
      data: meal
    }
  end
end
