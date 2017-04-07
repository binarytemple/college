defmodule College.Image do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition

  @versions [:original]

  #not sure if this is necessary
  def __storage, do: Arc.Storage.Local

  # To add a thumbnail version:
  @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _) do
     {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  end

  # Override the persisted filenames:
  #def filename(version, {file,artefact}) do
    #   #filename_VERSION = #{inspect(version)}
    #    IO.inspect("filename ... #{inspect(version)} - #{inspect({file,artefact})} ")  
    #   artefact.id
   # end

  ## Override the storage directory:
  def storage_dir(version, {file, artefact}) do
  ## IO.inspect("""
  ## storage_dir_VERSION = #{inspect(version)}
  ## storage_dir_FILE    = #{inspect(file   )}
  ## SCOPE   = #{inspect(scope  )}

  ## """)  
  "uploads/artefacts/#{artefact.id}"
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
