defmodule TwilioSmsTest do
  @moduledoc """
  Documentation for `TwilioSmsTest`.
  """

  def child_spec do
    {Finch, name: __MODULE__, pools: :default}
  end

  def send_sms() do
    sid = ""
    auth = ""
    base = "https://api.twilio.com/2010-04-01/Accounts"
    url = "#{base}/#{sid}/Messages.json"
    from = "+"
    to = "+"

    :post
    |> Finch.build(url, [{"Authorization", "Base #{sid}:#{auth}"}])
    |> Finch.request()
  end
end
