defmodule Exmeal.Users.Delete do
  alias Exmeal.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.new_not_found_user()}
      user -> Repo.delete(user)
    end
  end
end
