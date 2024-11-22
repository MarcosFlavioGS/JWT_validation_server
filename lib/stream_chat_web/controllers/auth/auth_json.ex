defmodule StreamChatWeb.Auth.AuthJSON do
  def verify(%{token_response: token_response}) do
    %{
      message: "Token validated !",
      data: token_response
    }
  end
end
