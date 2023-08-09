defmodule ElixirRolit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirRolitWeb.Telemetry,
      # Start the Ecto repository
      ElixirRolit.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirRolit.PubSub},
      # Start Finch
      {Finch, name: ElixirRolit.Finch},
      # Start the Endpoint (http/https)
      ElixirRolitWeb.Endpoint
      # Start a worker by calling: ElixirRolit.Worker.start_link(arg)
      # {ElixirRolit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirRolit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirRolitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
