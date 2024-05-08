class Event < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :attendances, dependent: :destroy

  # Validations
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true
end
