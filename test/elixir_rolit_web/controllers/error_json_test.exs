defmodule ElixirRolitWeb.ErrorJSONTest do
  use ElixirRolitWeb.ConnCase, async: true

  test "renders 404" do
    assert ElixirRolitWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ElixirRolitWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
