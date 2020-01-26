defmodule Securion.Utils do
  @moduledoc false

  def created_object([]) do
    %{}
  end

  def created_object(params) do
    %{created: Enum.into(params, %{})}
  end
end
