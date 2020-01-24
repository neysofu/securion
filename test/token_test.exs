defmodule Securion.Test.Token do
  use ExUnit.Case
  alias Securion.Token

  test "creating a card token from a fake Visa" do
    {:ok, token} = Token.create("4242424242424242", "11", "2022", "123")
    assert token["objectType"] == "token"
  end

  test "registering an invalid card token fails" do
    {:ok, %{"error" => reason}} = Token.create("4532582477951947", "11", "2022", "123")
    assert reason["code"] == "invalid_expiry_year"
    assert reason["type"] == "card_error"
  end
end
