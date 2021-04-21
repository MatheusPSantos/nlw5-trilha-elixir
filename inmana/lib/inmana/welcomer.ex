defmodule Inmana.Welcomer do
  # receber nome e idade do usuário
  def welcome(params) do
    age = params["age"] |> String.to_integer()

    params["name"]
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    "You are very especial"
  end

  defp evaluate(name, _age) do
    "Welcome #{name}"
  end
end
