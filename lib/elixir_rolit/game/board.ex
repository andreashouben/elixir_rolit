defmodule Rolit.Board do
  @colors [:red, :blue, :green, :yellow]
  @size 8

  defstruct rows: [@size_times | @size_times]

  defp @size_times, do: Enum.times(@size, fn _ -> [] end)

  # Function to initialize a new game board
  def new() do
    %Rolit.Board{}
    |> initialize_starting_colors()
  end

  defp initialize_starting_colors(board) do
    mid = (@size - 1) / 2

    Enum.reduce(@colors, board, fn color, acc ->
      place_disc(acc, mid, mid, color)
    end)
  end

  # ... (other functions from previous implementation)

  # Function to print the board
  def print_board(board) do
    Enum.each(0..(@size - 1), fn row ->
      row_str = Enum.reduce(board.rows |> Enum.at(row), "", fn disc, acc ->
        acc <> disc_color_to_string(disc) <> " "
      end)
      IO.puts(row_str)
    end)
  end

  # ... (other functions from previous implementation)

  defp disc_color_to_string(nil), do: "."
  defp disc_color_to_string(:red), do: "R"
  defp disc_color_to_string(:blue), do: "B"
  defp disc_color_to_string(:green), do: "G"
  defp disc_color_to_string(:yellow), do: "Y"
end
