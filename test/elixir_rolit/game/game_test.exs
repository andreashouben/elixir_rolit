defmodule Rolit.GameTest do
  use ExUnit.Case

  test "initial board setup" do
    board = Rolit.Game.new_board()

    assert board == %Rolit.Board{
      rows: [
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, :red, :blue, nil, nil, nil],
        [nil, nil, nil, :green, :yellow, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    }
  end
end
