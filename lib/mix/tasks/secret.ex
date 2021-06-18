defmodule Mix.Tasks.Secret do
  @moduledoc "Decrypt contentful secrets"
  @shortdoc "Decrypt contentful secrets"

  use Mix.Task

  @impl Mix.Task
  def run([secret]) do
    app_dir = File.cwd!()

    new_file_path = Path.join([app_dir, ".secret-key"])

    File.write(new_file_path, secret, [:write])

    Mix.Shell.cmd("mix secrex.decrypt", fn output -> IO.write(output) end)
    File.rm!(new_file_path)
  end
end
