class Stock < ApplicationRecord


  def self.look_up(ticker)
      client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      secret_token: 'Tsk_592e3c7abdf141b890a454b8f1cba0c5',
      endpoint: 'https://sandbox.iexapis.com/v1'
      )

      client.price(ticker)

  end

end
