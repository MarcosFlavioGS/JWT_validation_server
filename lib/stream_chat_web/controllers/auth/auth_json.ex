defmodule StreamChatWeb.Auth.AuthJSON do
  @moduledoc false

  def verify(%{token_response: token_response}) do
    %{
      message: "Token validated !",
      data: token_response
    }
  end
end
