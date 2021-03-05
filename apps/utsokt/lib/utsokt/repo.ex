defmodule Utsokt.Repo do
  use Ecto.Repo,
    otp_app: :utsokt,
    adapter: Ecto.Adapters.Postgres
end
