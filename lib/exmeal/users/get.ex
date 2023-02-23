defmodule Exmeal.Users.Get do
  alias Exmeal.{Error, User, Repo}

  def by_id(id) do
    with %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      nil -> {:error, Error.new_not_found_user()}
    end
  end
end
