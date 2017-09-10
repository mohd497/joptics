class Product < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  mount_uploader :secavatar, SecavatarUploader
  mount_uploader :thirdavatar, ThirdavatarUploader
  mount_uploader :fourthavatar, FourthavatarUploader
  mount_uploader :fifthavatar, FifthavatarUploader
  mount_uploader :sixthavatar, SixthavatarUploader
  mount_uploader :seventhavatar, SeventhavatarUploader
  mount_uploader :eighthavatar, EighthavatarUploader
  mount_uploader :ninthavatar, NinthavatarUploader
  mount_uploader :tenthavatar, TenthavatarUploader
  mount_uploader :itemspec, ItemspecUploader

  has_one :presciptions
  scope :is_enabled, -> { where(status: true) }

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1.0 }
  validates :name, uniqueness: true

  scope :with_category, lambda { |flag|
    where(category:[*flag])
  }

end
