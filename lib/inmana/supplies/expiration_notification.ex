defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{GetByExpiration, ExpirationMail}
  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationMail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
