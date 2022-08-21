class ReservationPolicy < BasePolicy
  def edit
    record.owner? || record.admin?
  end

  def update
    record.owner? || record.admin?
  end

  def destroy
    record.owner? || record.admin?
  end
end