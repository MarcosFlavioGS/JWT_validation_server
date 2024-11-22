defmodule StreamChat.Auth.Auth do
  @moduledoc """
		Module responsable for all token functions

		verify/1

		token/0
	"""

	alias StreamChat.Token

	@doc """
		verify/1 :: {:ok, response} | {:error, reason}

		Verify and validates a token
	"""
  def check %{"token" => token} do
		Token.verify_and_validate(token)
  end

	@doc """
		token/0 :: {token, claims}

		Generates a token using default signer
	"""
  def token do
    {:ok, token, claims} = Token.generate_and_sign()

	{token, claims}
  end
end
