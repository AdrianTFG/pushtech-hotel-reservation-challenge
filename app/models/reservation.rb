class Reservation < ApplicationRecord
  validates_presence_of :hotel_name, :price, :currency, :customer_name, :customer_email
  validates_format_of :customer_email, with: URI::MailTo::EMAIL_REGEXP
end
