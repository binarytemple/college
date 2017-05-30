defmodule College.Credentials do
  use College.Web, :model

  schema "credentials" do
    field :strategy, :string
    field :token1, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:strategy, :email, :password, :token1])
    |> validate_required([:strategy, :email, :password, :token1])
  end
end
