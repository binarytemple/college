defmodule UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias Ueberauth.Auth

  def find_or_create(%Auth{provider: :identity} = auth) do
    case authenticate_pass(%{ uid: auth.uid, password: auth.credentials.other.password}) do
      :ok ->
        {:ok, basic_info(auth)}
      {:error, reason} -> {:error, reason}
    end
  end

  def find_or_create(%Auth{} = auth) do
    {:ok, basic_info(auth)}
  end

  defp basic_info(auth) do
    %{id: auth.uid, name: name_from_auth(auth), avatar: auth.info.image}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end

  defp authenticate_pass(%{password: ""}) do
    {:error, "Password required"}
  end
  defp authenticate_pass(%{uid: uid, password: pw }) do
    :ok
  end
  defp authenticate_pass(_), do: {:error, "Bad auth"}
end
