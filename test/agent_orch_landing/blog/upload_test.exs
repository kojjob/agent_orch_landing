defmodule AgentOrchLanding.Blog.UploadTest do
  use ExUnit.Case, async: true

  alias AgentOrchLanding.Blog.Upload

  describe "unique_filename/1" do
    test "generates a UUID-based filename preserving extension" do
      filename = Upload.unique_filename("photo.jpg")
      assert String.ends_with?(filename, ".jpg")
      # UUID is 36 chars + extension
      assert String.length(filename) > 36
    end

    test "preserves different extensions" do
      assert String.ends_with?(Upload.unique_filename("image.png"), ".png")
      assert String.ends_with?(Upload.unique_filename("pic.webp"), ".webp")
      assert String.ends_with?(Upload.unique_filename("anim.gif"), ".gif")
    end

    test "generates unique filenames each time" do
      name1 = Upload.unique_filename("photo.jpg")
      name2 = Upload.unique_filename("photo.jpg")
      assert name1 != name2
    end
  end

  describe "upload_dir/0" do
    test "returns the expected upload directory" do
      assert Upload.upload_dir() == "priv/static/uploads"
    end
  end
end
