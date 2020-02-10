defmodule Securion.Test.Token do
  use ExUnit.Case
  alias Securion.Token
  import Securion.FakeCards

  test "create card token from fake Visa" do
    params = visa_3() |> Map.put(:cardholder_name, "John Doe")
    {:ok, token} = Token.create(params)
    assert token.object_type == "token"
  end

  test "registering an invalid card token fails" do
    {:error, reason} = Token.create(invalid_exp_year())

    assert reason.code == "invalid_expiry_year"
    assert reason.type == "card_error"
  end
end
