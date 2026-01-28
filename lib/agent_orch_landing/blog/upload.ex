defmodule AgentOrchLanding.Blog.Upload do
  @upload_dir "priv/static/uploads"

  def save_upload(socket, upload_name) do
    uploaded_files =
      Phoenix.LiveView.consume_uploaded_entries(socket, upload_name, fn %{path: path}, entry ->
        filename = unique_filename(entry.client_name)
        dest = Path.join(upload_dir(), filename)
        File.cp!(path, dest)
        {:ok, "/uploads/#{filename}"}
      end)

    List.first(uploaded_files)
  end

  def unique_filename(original_name) do
    ext = Path.extname(original_name)
    "#{Ecto.UUID.generate()}#{ext}"
  end

  def upload_dir, do: @upload_dir
end
