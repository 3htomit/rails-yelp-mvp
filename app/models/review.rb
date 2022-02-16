class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: {
    in: 0..5,
    message: "%{value} is not a number between 0 and 5"
  }
end
