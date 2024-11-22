defmodule StreamChatWeb.Auth.FallbackController do
  @moduledoc false

  use StreamChatWeb, :controller

  def call(conn, {:error, reason}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: StreamChatWeb.Auth.ErrorJSON)
    |> render(:error, reason: reason)
  end
end
