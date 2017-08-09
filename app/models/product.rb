class Product < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  has_many :order_lines
  scope :is_enabled, -> { where(status: true) }

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1.0 }
  validates :name, uniqueness: true
end
