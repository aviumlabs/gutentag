defmodule Gutentag.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gutentag.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gutentag.PubSub},
      # Start Finch
      {Finch, name: Gutentag.Finch}
      # Start a worker by calling: Gutentag.Worker.start_link(arg)
      # {Gutentag.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Gutentag.Supervisor)
  end
end
