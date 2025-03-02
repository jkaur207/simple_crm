class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, presence: true
end
