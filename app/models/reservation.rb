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

end
