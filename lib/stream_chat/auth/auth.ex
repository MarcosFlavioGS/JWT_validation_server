defmodule StreamChat.Auth.Auth do
  @moduledoc """
		Module responsable for all token handling functions

		validate/1

		token/0
	"""

	alias StreamChat.Token

	@secret_key System.get_env("JWT_SECRET") || ""

	@doc """
		validate/1 :: {:ok, response} | {:error, reason}

		Verify and validates a token
	"""
  def validate %{"token" => token} do
		Token.verify_and_validate(token, signer("HS256", @secret_key))
  end

	@doc """
		token/1 :: {token, claims}

		Generates a token using a custom signer
	"""
  def token _algorithm do
    {:ok, token, claims} = Token.generate_and_sign(%{}, signer("HS256", @secret_key))

	{token, claims}
  end

	@doc """
		token/0 :: {token, claims}

		Generates a token using the default signer
	"""
	def token do
    {:ok, token, claims} = Token.generate_and_sign()

	{token, claims}
  end

	defp signer algorithm, secret do
	  Joken.Signer.create(algorithm, secret)
	end
end
