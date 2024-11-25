defmodule StreamChatWeb.Auth.FallbackController do
  @moduledoc false

  use StreamChatWeb, :controller

  def call(conn, {:error, :signature_error}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: StreamChatWeb.Auth.ErrorJSON)
    |> render(:error, reason: :signature_error)
  end

  def call(conn, {:error, _reason}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: StreamChatWeb.Auth.ErrorJSON)
    |> render(:error, reason: "Invalid token")
  end
end
