defmodule Securion.Test.Card do
  use ExUnit.Case
  import Securion.FakeCards

  @email "foo@example.com"

  test "can't get a JCB card after delete" do
    {:ok, token} = Securion.Token.create(jcb_1())
    {:ok, customer} = Securion.Customer.create(@email)
    t_id = token.id
    c_id = customer.id
    {:ok, card} = Securion.Card.create_by_token(c_id, t_id)
    id = card.id
    Securion.Card.delete(c_id, id)
    {:ok, card} = Securion.Card.get(c_id, id)
    assert card.deleted
    Securion.Customer.delete(c_id)
  end
end
