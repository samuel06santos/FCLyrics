defmodule FaroesteCaboclo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FaroesteCabocloWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:faroeste_caboclo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FaroesteCaboclo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FaroesteCaboclo.Finch},
      # Start a worker by calling: FaroesteCaboclo.Worker.start_link(arg)
      # {FaroesteCaboclo.Worker, arg},
      # Start to serve requests, typically the last entry
      FaroesteCabocloWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FaroesteCaboclo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FaroesteCabocloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
