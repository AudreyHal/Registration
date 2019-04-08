defmodule Registration.Repo do
  use Ecto.Repo,
    otp_app: :registration,
    adapter: Ecto.Adapters.Postgres
end
