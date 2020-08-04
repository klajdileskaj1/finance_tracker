class Stock < ApplicationRecord

  has_many:user_stocks
  has_many:users,through: :user_stocks



  def self.look_up(ticker_name)
      client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      secret_token: 'Tsk_592e3c7abdf141b890a454b8f1cba0c5',
      endpoint: 'https://sandbox.iexapis.com/v1'
      )

    begin
      new(ticker:ticker_name,name: client.company(ticker_name).company_name,price:client.price(ticker_name))
    rescue => exception
      return nil
    end

  end

  def self.check_db( ticker_name )

    where(ticker:ticker_name).first

  end

end
