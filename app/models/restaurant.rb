class Restaurant < ApplicationRecord
  # dependent: :destroy will make sure that reviews will also be deleted when you delete the restaurant
  has_many :reviews, dependent: :destroy

  # cannot be blank
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
