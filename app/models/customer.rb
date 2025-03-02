class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, presence: true

  def has_image?
    image.attached?
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "full_name", "email", "phone_number", "notes", "created_at", "updated_at", "has_image"]
  end
end
