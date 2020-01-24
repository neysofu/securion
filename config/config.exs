use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

if Mix.env() == :securionpay_env do
  config :securion, secret_key: System.get_env("SECURIONPAY_SECRET_KEY")
end
