defmodule Cardinitex.V1.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:amount, :decimal)
    field(:currency, :string)
    field(:created, :naive_datetime)
    field(:type, :string)
    field(:live, :boolean)
    field(:settle, :boolean, default: true)
    field(:status)
    field(:error)
    field(:order_id)
    field(:country_code)
    field(:payment_method)
    embeds_one(:payment_instrument, Card)
  end

  def changeset(payment) do
    payment
    |> validate_length(:currency, is: 3)
    |> validate_inclusion(:status, ["approved", "declined", "pending"])
    |> validate_inclusion(:type, ["authorization", "purchase"])
    |> validate_inclusion(:amount, 0..150)
  end
end
