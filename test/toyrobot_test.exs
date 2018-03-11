defmodule ToyRobotTest do
  use ExUnit.Case
  #import ToyRobot

  test "places the ToyRobot on the table in default position" do
    assert ToyRobot.place == %ToyRobot.Position{x: 0, y: 0, facing: :north}
  end
  
  test "places th ToyRobot on the table in specified position" do
      assert ToyRobot.place(1, 2, :south) == %ToyRobot.Position{x: 1, y: 2, facing: :south}
  end

end
