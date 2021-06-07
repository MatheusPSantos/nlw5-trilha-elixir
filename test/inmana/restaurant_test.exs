defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "siri@cascudo.com", name: "Siri cascudo"},
               valid?: true
             } = response
    end

    test "when there are invalid params, return an invalid changeset" do
      params = %{name: "Ab", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert erros_on(response) == "banana"
    end
  end
end
