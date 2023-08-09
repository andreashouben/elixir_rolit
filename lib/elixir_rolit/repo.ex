defmodule ElixirRolit.Repo do
  use Ecto.Repo,
    otp_app: :elixir_rolit,
    adapter: Ecto.Adapters.Postgres
end
