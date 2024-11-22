defmodule StreamChatWeb.Auth.AuthController do
  use StreamChatWeb, :controller

  alias StreamChat.Auth.Auth

  action_fallback StreamChatWeb.Auth.FallbackController

  def verify conn, token do
    with {:ok, map} <- Auth.check(token) do
	  conn
	  |> put_status(:ok)
	  |> render(:verify, map: map)
	end
  end

end
