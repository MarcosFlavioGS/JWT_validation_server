defmodule StreamChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StreamChatWeb.Telemetry,
      StreamChat.Repo,
      {DNSCluster, query: Application.get_env(:stream_chat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StreamChat.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StreamChat.Finch},
      # Start a worker by calling: StreamChat.Worker.start_link(arg)
      # {StreamChat.Worker, arg},
      # Start to serve requests, typically the last entry
      StreamChatWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StreamChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StreamChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
