defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns special message" do
      params = %{"name" => "banana", "age" => "42"}
      result = Welcomer.welcome(params)
      expected_result = {:ok, "You are very special"}
      assert result == expected_result
    end
  end
end
