defmodule StreamChat.Auth.Auth do
  @moduledoc false

  def check token do
	response = StreamChat.Token.verify(token)
  end

  def token do
    {:ok, token, claims} = StreamChat.Token.generate_and_sign()

	{token, claims}
  end
end
