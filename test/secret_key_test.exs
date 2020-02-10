defmodule Securion.Test.SecretKey do
  use ExUnit.Case

  test "secret key begins with sk_test_" do
    secret_key = Application.get_env(:securion, :secret_key)
    assert String.starts_with?(secret_key, "sk_test_")
  end
end
