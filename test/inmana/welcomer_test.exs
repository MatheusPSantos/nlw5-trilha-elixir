defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "Jhon", "age" => "23"}
      expected_result = {:ok, "Welcome Jhon"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "Jhon", "age" => "12"}
      expected_result = {:ok, "You shall not pass Jhon"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
