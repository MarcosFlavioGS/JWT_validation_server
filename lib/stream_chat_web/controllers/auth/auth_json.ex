defmodule StreamChatWeb.Auth.AuthJSON do
  def verify(%{map: map}) do
    %{
      message: "Token validated !",
      data: map
    }
  end
end
