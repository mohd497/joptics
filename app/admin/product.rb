ActiveAdmin.register Product do
# See permitted parameters documentation:
  permit_params :name, :description, :price, :status, :avatar, :secavatar, :amount,
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

  action_item only: :show  do
    link_to "product delete with prescription", product_path, method: :delete
  end

  form do |f|
    f.input :name,:input_html => {:style => 'width: 10%; margin-bottom: 20px; margin-left: 20px;'}
    f.input :brand,:input_html => {:style => 'width: 15%; margin-bottom: 20px;margin-left: 20px;'}
    f.input :amount,:input_html => {:style => 'width: 10%; margin-bottom: 20px; margin-left: 20px;'}
    f.input :description,:input_html => {:style => 'width: 15%;margin-bottom: 20px;margin-left: 20px;'}
    f.input :price,:input_html => {:style => 'width: 10%; margin-bottom: 20px;margin-left: 20px;'}
    f.input :status,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :avatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :secavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :thirdavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :fourthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :fifthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :sixthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :seventhavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :eighthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :ninthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :tenthavatar,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :itemspec,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :newarrivals,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :bestselling,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :popularbrand,:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :frames, :as => :select, :collection => [['half rim','half rim'],['full rim','full rim'],['rimless','rimless']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :shapes, :as => :select, :collection => [['aviator','aviator'],['rectangle','rectangle'],['oval','oval'],['sheild','sheild'],['wayfarer','wayfarer'],['cat','cat']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :material, :as => :select, :collection => [['titanium','titanium'],['plastic','plastic'],['metal','metal'],['wood','wood']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :size, :as => :select, :collection => [['small','small'],['medium','medium'],['large','large']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :color,:input_html => {:style => 'width:10%; margin-bottom: 20px;'}
    f.input :rx_type,:input_html => {:style => 'width:10%; margin-bottom: 20px;'}
    f.input :category, :as => :select, :collection => [['men','men'],['women','women'],['kids','kids']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.input :subcategory, :as => :select, :collection => [['eyeglasses','eyeglasses'],['preglasses','preglasses'],['sunglasses','sunglasses'],['powerglasses','powerglasses']],:input_html => {:style => 'margin-bottom: 20px;'}
    f.actions
  end

end
