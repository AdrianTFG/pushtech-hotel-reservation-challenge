class Room < ApplicationRecord
  validates_presence_of :room_name, :description, :price, :currency

  has_many :reservations, dependent: :restrict_with_exception

  before_save :two_decimals_price

  CURRENCIES = {"EUR" => {symbol: '€', separator: '.', decimals: ','},
                "USD" => {symbol: '$', separator: ',', decimals: '.'},
                "GBP" => {symbol: '£', separator: '.', decimals: ','}}

  def self.format_number(number, currency)
    if number.blank?
      return 0
    else
      whole, decimal = number.round(2).to_s.split(".")
      num_groups = whole.chars.to_a.reverse.each_slice(3)
      whole_with_commas = num_groups.map(&:join).join(CURRENCIES[currency][:separator]).reverse
      [whole_with_commas, decimal].compact.join(CURRENCIES[currency][:decimals])
    end
  end

  private

  def two_decimals_price
    self.price = price.round(2)
  end
end
