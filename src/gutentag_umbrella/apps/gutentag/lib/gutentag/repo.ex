defmodule Gutentag.Repo do
  use Ecto.Repo,
    otp_app: :gutentag,
    adapter: Ecto.Adapters.Postgres
end
