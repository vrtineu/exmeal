defmodule Exmeal.Error do
  @keys [:result, :status]
  @enforce_keys @keys

  defstruct @keys

  def new(result, status) do
    %__MODULE__{
      result: result,
      status: status
    }
  end

  def new_not_found_meal, do: new("Meal not found", :not_found)
  def new_not_found_user, do: new("User not found", :not_found)
end
