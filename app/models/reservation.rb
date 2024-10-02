class Reservation < ApplicationRecord
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validates :number_of_people, presence: true, numericality: { greater_than: 0 }
  validate :checkin_date_cannot_be_in_the_past
  validate :checkout_date_cannot_be_in_the_past_than_the_checkin_date
      
  def checkin_date_cannot_be_in_the_past
    if checkin_date.present? && checkin_date < Date.today
      errors.add(:checkin_date, "は本日以降の日付を入力してください")
    end
  end

  def checkout_date_cannot_be_in_the_past_than_the_checkin_date
    if checkin_date.present? && checkout_date.present? && checkout_date < checkin_date
      errors.add(:checkout_date, "はチェックイン日以降の日付を入力してください")
    end
  end

  def reservation_date
    (checkout_date - checkin_date).to_i
  end

  def total_cost
    reservation_date * number_of_people * room.cost
  end

  belongs_to :user
  belongs_to :room
end
