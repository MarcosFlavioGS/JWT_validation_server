defmodule StreamChat.Auth.Auth do
  @moduledoc false

  def check %{"token" => token} do
		StreamChat.Token.verify_and_validate(token)
  end

  def token do
    {:ok, token, claims} = StreamChat.Token.generate_and_sign()

	{token, claims}
  end
end
