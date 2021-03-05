defmodule Utsokt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Utsokt.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Utsokt.PubSub}
      # Start a worker by calling: Utsokt.Worker.start_link(arg)
      # {Utsokt.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Utsokt.Supervisor)
  end
end
