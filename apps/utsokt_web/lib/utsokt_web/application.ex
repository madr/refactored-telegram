defmodule UtsoktWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      UtsoktWeb.Telemetry,
      # Start the Endpoint (http/https)
      UtsoktWeb.Endpoint
      # Start a worker by calling: UtsoktWeb.Worker.start_link(arg)
      # {UtsoktWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UtsoktWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UtsoktWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
