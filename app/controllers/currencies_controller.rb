class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys
    render({:template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @symbol1 = params.fetch("currency1")

    render({:template => "currency_templates/step_two.html.erb"})
  end

  def convert
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @symbol1 = params.fetch("currency1")
    @symbol2 = params.fetch("currency2")
    
    @calculator = open("https://api.exchangerate.host/convert?from=#{@symbol1}&to=#{@symbol2}").read
    @calculator_data = JSON.parse(@calculator)
    @exchange_hash = @calculator_data.fetch("info").fetch("rate")


    render({:template => "currency_templates/final_step.html.erb"})
  end

end