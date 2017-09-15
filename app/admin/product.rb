ActiveAdmin.register Product do
# See permitted parameters documentation:
  permit_params :name, :description, :price, :status, :avatar, :secavatar,
                :thirdavatar, :fourthavatar,
                :fifthavatar, :sixthavatar,
                :seventhavatar, :eighthavatar,
                :ninthavatar, :tenthavatar, :itemspec, :category, :subcategory, :newarrivals,
                :bestselling, :popularbrand, :brand, :frames, :shapes,
                :material, :size, :color, :rx_type

  scope :all, :default => true
  scope :available do |products|
    products.where("created_at < ?", Date.today)
  end
  scope :drafts do |products|
    products.where("created_at > ?", Date.today)
  end

  show :name => :name


end
