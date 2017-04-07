defmodule College.Artefact do
  use College.Web, :model
  use Arc.Ecto.Schema
  use Arc.Definition
  use Arc.Ecto.Definition

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "artefacts" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :image, College.Image.Type
    field :original_filename, :string
    belongs_to :user, College.User

    timestamps()
  end

  @required ~w(id)a
  @optional ~w(url, title, description)a
  @required_file_fields ~w(image)a
  @optional_file_fields ~w()a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\  %{})  do 
    case Map.has_key?(params,"id") do
      true  -> build_changeset(struct, params)
      false -> build_changeset(struct, Map.put(params,"id", UUID.uuid4()))
      #Map.put(params,"original_filename", params.filename ) 
    end 
  end

  defp build_changeset(struct, params)  do 
    IO.inspect( "changeset params -   #{inspect(params)} " ) 
    
    struct 
    |> cast(params, @required)
    |> cast_attachments(params, @required_file_fields , @optional_file_fields)
    |> validate_required(@required)
    |> IO.inspect
  end 

end
