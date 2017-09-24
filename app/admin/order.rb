ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  scope :done_order, default: true

  show do
    panel "Orders" do

      table_for order.presciptions do

        column "cost" do |presciption|
          presciption.total_cost
        end

        column "sphere left" do |presciption|
          presciption.sphere
        end

        column "cylinder left" do |presciption|
          presciption.cylinder
        end

        column "axis left" do |presciption|
          presciption.axis
        end

        column "add left" do |presciption|
          presciption.add
        end

        column "pd left" do |presciption|
          presciption.pd
        end

        column "sphere right" do |presciption|
          presciption.sphere_right
        end

        column "cylinder right" do |presciption|
          presciption.cylinder_right
        end

        column "axis right" do |presciption|
          presciption.axis_right
        end

        column "add right" do |presciption|
          presciption.add_right
        end

        column "pd right" do |presciption|
          presciption.pd_right
        end

        column "pre type" do |presciption|
          presciption.pre_type
        end

        column "lense type" do |presciption|
          presciption.lense_type
        end

        column "protective coating" do |presciption|
          presciption.protective_coating
        end

        column "scratch resistant coating" do |presciption|
          presciption.scratch_resistant_coating
        end

        column "anti reflective coating" do |presciption|
          presciption.anti_reflective_coating
        end

      end

      table_for order.presciptions do

        column "id" do |presciption|
          presciption.product.id
        end

        column "name" do |presciption|
          presciption.product.name
        end

        column "price" do |presciption|
          presciption.product.price
        end

      end

      table_for order.shipping_address do

        column "id" do |address|
          address.id
        end

        column "phone_number" do |address|
          address.phone_number
        end

        column "first_name" do |address|
          address.first_name
        end

        column "last_name" do |address|
          address.last_name
        end

        column "email" do |address|
          address.email
        end

        column "country" do |address|
          address.country
        end

        column "province" do |address|
          address.province
        end

        column "city" do |address|
          address.city
        end

        column "postal code" do |address|
          address.postal_code
        end

        column "address" do |address|
          address.address
        end
       end

      table_for order.shipping_address do

        column "shipping_country" do |address|
          address.shipping_country
        end

        column "shipping_province" do |address|
          address.shipping_province
        end

        column "shipping_city" do |address|
          address.shipping_city
        end

        column "shipping_postal code" do |address|
          address.shipping_postal_code
        end

        column "shipping_address" do |address|
          address.shipping_address
        end


      end

    end
  end

end
