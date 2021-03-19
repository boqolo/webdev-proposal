defmodule TwilioSmsTestTest do
  use ExUnit.Case
  doctest TwilioSmsTest

  test "greets the world" do
    assert TwilioSmsTest.hello() == :world
  end
end
