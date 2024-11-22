defmodule StreamChatWeb.Auth.AuthController do
  @moduledoc false

  use StreamChatWeb, :controller

  alias StreamChat.Auth.Auth

  action_fallback StreamChatWeb.Auth.FallbackController

  def verify conn, token do
    with {:ok, token_response} <- Auth.validate(token) do
	  conn
	  |> put_status(:ok)
	  |> render(:verify, token_response: token_response)
	end
  end

end
