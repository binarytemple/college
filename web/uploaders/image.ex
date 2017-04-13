defmodule College.Image do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition

  #not sure if this is necessary
  def __storage, do: Arc.Storage.Local

  # To add a thumbnail version:
  @versions [:original, :thumb, :mini]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _file) do
     {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  end

  def transform(:mini, _file) do
     {:convert, "-strip -thumbnail 125x125^ -gravity center -extent 125x125 -format png", :png}
  end

  # Override the persisted filenames:
  def filename(version, {file,scope}) do
    #IO.inspect("filename: #{inspect({version,{_file,scope}})}")
    case scope do
      nil -> raise "Unexpected filename request: '#{inspect({version,{file,scope}})}'"
      _ -> "#{scope.id}_#{version}"
    end
  end

  ## Override the storage directory:
  def storage_dir(_version, {_file, artefact}) do
    "#{Application.get_env(:college, :upload_dir)}/#{artefact.user_id}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end
end
