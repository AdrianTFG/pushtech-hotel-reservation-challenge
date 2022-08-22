class Reservation < ApplicationRecord
  validates_presence_of :room_id, :customer_name, :customer_email
  validates_format_of :customer_email, with: URI::MailTo::EMAIL_REGEXP
  validates_comparison_of :departure_date, greater_than: :entry_date

  belongs_to :room
  belongs_to :user, default: -> { Current.user }

  def owner?
    user_id == Current.user.id
  end

  def admin?
    Current.user.admin?
  end
end
