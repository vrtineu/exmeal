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
end
