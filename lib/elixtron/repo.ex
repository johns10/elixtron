defmodule Elixtron.Repo do
  use Ecto.Repo,
    otp_app: :elixtron,
    adapter: Ecto.Adapters.Postgres
end
