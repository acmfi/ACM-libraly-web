defmodule Libralyweb.Repo do
  use Ecto.Repo,
    otp_app: :libralyweb,
    adapter: Ecto.Adapters.Postgres

    use Paginator
end
