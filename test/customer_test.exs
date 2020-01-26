defmodule Securion.Test.Customer do
  use ExUnit.Case
  alias Securion.Customer

  test "simply creating a customer" do
    {:ok, customer} = Customer.create("example@streamama.live")
    assert customer.object_type == "customer"
    {:ok, _} = Customer.delete(customer.id)
  end

  test "creating and then fetching the same customer" do
    {:ok, customer_a} = Customer.create("example@streamama.live")
    id = customer_a.id
    {:ok, customer_b} = Customer.get(id)
    assert customer_a == customer_b
    {:ok, _} = Customer.delete(id)
    {:ok, customer} = Customer.get(id)
    assert customer.deleted
  end
end
