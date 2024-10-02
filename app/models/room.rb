class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true

  mount_uploader :img, RoomImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy

  def self.search_for(word, address_word)
    if word.present? && address_word.present?
      Room.where("name LIKE ? OR introduction LIKE ? AND address LIKE ?", "%#{word}%", "%#{word}%", "%#{address_word}%")
    elsif word.present?
      Room.where("name LIKE ? OR introduction LIKE ?", "%#{word}%", "%#{word}%")
    elsif address_word.present?
      Room.where("address LIKE ?", "%#{address_word}%")
    else
      Room.all
    end
  end
end
