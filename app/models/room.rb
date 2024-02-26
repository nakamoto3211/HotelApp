class Room < ApplicationRecord
  mount_uploader :hotel_image, ImageUploader

  belongs_to :user
  has_many :reservations

  def self.search(area, keyword)
    if area.present? and keyword.present?
      Room.where(['address LIKE(?) AND ( name LIKE(?) OR detail LIKE(?) )',"%#{area}%", "%#{keyword}%", "%#{keyword}%"])
    elsif area.present? and keyword.blank?
      Room.where(['address LIKE(?)', "%#{area}%"])
    elsif area.blank? and keyword.present?
      Room.where(['name LIKE(?) OR detail LIKE(?)', "%#{keyword}%", "%#{keyword}%"])
    else
      Room.all
    end
  end

end
