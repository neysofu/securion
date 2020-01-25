defmodule Securion.FakeCards do
  @moduledoc """
  Fake cards to test API calls (see the official
  [https://securionpay.com/docs/testing](docs) for more).
  """

  defp card(card_number) do
    %{
      number: card_number,
      expMonth: 12,
      expYear: 2040,
      cvc: "123"
    }
  end

  def visa_1 do
    card("4012000100000007")
  end

  def visa_2 do
    card("4242424242424242")
  end

  def visa_3 do
    card("4012888888881881")
  end

  def visa_debit do
    card("4000056655665556")
  end

  def mastercard_1 do
    card("5555555555554444")
  end

  def mastercard_debit do
    card("5200828282828210")
  end

  def mastercard_2 do
    card("5105105105105100")
  end

  def mastercard_3 do
    card("2222000000000008")
  end

  def maestro do
    card("6759649826438453")
  end

  def american_express_1 do
    card("378282246310005")
  end

  def american_express_2 do
    card("371449635398431")
  end

  def discover_1 do
    card("6011111111111117")
  end

  def discover_2 do
    card("6011000990139424")
  end

  def diners_club_1 do
    card("30569309025904")
  end

  def diners_club_2 do
    card("38520000023237")
  end

  def jcb_1 do
    card("3530111333300000")
  end

  def jcb_2 do
    card("3566002020360505")
  end

  def invalid_number do
    card("4024007102349866")
  end

  def invalid_exp_month do
    card("4532873294814636")
  end

  def invalid_exp_year do
    card("4532582477951947")
  end

  def invalid_cvc do
    card("4024007189368227")
  end

  def expired do
    card("4916487051294548")
  end

  def incorrect_cvc do
    card("4024007134364842")
  end

  def incorrect_zip do
    card("4929225021529113")
  end

  def insufficient_funds do
    card("4024007118468684")
  end

  def lost_or_stolen do
    card("4024007114621187")
  end

  def suspected_fraud do
    card("4024007155502486")
  end

  def declined do
    card("4916018475814056")
  end

  def processing_error do
    card("4024007114166316")
  end

  def cvc_123(cvc) do
    %{card("4242000000000083") | cvc: cvc}
  end

  def dispute_chargeback do
    card("4242000000000018")
  end

  def retrieval_request do
    card("4242000000000026")
  end

  def deemed_safe do
    card("4242000000000042")
  end

  def deemed_suspicious do
    card("4242000000000059")
  end

  def deemed_fraudolent do
    card("4242000000000067")
  end

  def deemed_unknown do
    card("4242000000000075")
  end

  def with_3d_secure(switch) do
    if switch do
      card("4242000000000109")
    else
      card("4242000000000075")
    end
  end
end
