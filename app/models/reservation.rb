class Reservation < ApplicationRecord
  validates_presence_of :room_id, :customer_name, :customer_email
  validates_format_of :customer_email, with: URI::MailTo::EMAIL_REGEXP

  belongs_to :room
  belongs_to :user, default: -> { Current.user }
end
