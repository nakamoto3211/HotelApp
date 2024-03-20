class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :check_in
    validates :check_out
    validates :number_of_people
    validates :user_id
    validates :room_id
  end

  validate :date_before_checkin
  validate :date_before_checkout

  def date_before_checkin
    return if check_in.blank?
    errors.add(:check_in, "は今日以降のものを選択してください") if check_in < Date.today
  end

  def date_before_checkout 
    return if check_out.blank?
    errors.add(:check_out,"はチェックイン以降のものを選択してください") if check_out < check_out
  end
end
