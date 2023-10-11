defmodule ExtismExampleTest do
  use ExUnit.Case
  doctest ExtismExample

  test "calls extism" do
    manifest = %{wasm: [%{path: "priv/wasm/dist/plugin.wasm"}]}
    {:ok, plugin} = Extism.Plugin.new(manifest, true)
    {:ok, result} = Extism.Plugin.call(plugin, "foo", """
      {"foo": "bar"}
    """)
    assert result =~ ~r/bar and more/

    assert {:error, _} = Extism.Plugin.call(plugin, "foo", "hot { garbage}")
  end
end
