class LensController < ApplicationController

  before_action :get_current_order_search

  def enter_pre

    @pre_type = [["Distance / Frames Only", "Distance / Frames Only"], ["Reading Lenses", "Reading Lenses"],
                 ["Bifocal Lenses", "Bifocal Lenses"], ["Progressive Lenses", "Progressive Lenses"]]

    session[:product_id] = params['product']

    @len_one = []
    (-15.00..6.00).step(0.25) do |n|
      @len_one << [n, n]
    end

    @cyl_one = []
    (-6.00..4.00).step(0.25) do |n|
      @cyl_one << [n, n]
    end

    @axis_one = []
    (1..180).each do |n|
      @axis_one << [n, n]
    end

    @add_one = []
    (1.00..3.00).step(0.25) do |n|
      @add_one << [n, n]
    end

    @pd_one = []
    (26..40).step(0.5) do |n|
      @pd_one << [n, n]
    end

    @pre_commit = false

    if session[:order_id] and Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).present?
      @pre = Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).last
    else
      if session[:pre_token]
        pres = Presciption.where(:pre_token => session[:pre_token])
        @pre = Presciption.find(pres.last.id)
      else
        @pre = Presciption.new
        @pre_commit = true
      end
    end
  end

  def create
    @pre = Presciption.new(prescription_params)
    if @pre.save
      session[:pre_token] = Digest::SHA1.hexdigest([Time.now, rand].join)
      @pre.pre_token = session[:pre_token]
      @pre.product_id = session[:product_id].to_i
      @product = Product.find(@pre.product_id)
      @pre.total_cost = @product.price
      @pre.total_cost = @pre.total_cost * @pre.qty
      @pre.save
      redirect_to select_lens_path
    else
      render :enter_pre
    end
  end

  def update

    if session[:order_id] and Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).present?
      @pre = Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).last
    else
      pres = Presciption.where(:pre_token => session[:pre_token])
      @pre = Presciption.find(pres.last.id)
    end
      @product = Product.find(@pre.product_id)
      if @pre.qty.nil?
        @pre.total_cost = @pre.total_cost * params[:presciption][:qty]
      else

        total_number = @pre.qty
        (0 .. total_number).each do
          @pre.total_cost = @pre.total_cost - @product.price
        end

        total_param_number = params[:presciption][:qty].to_f
        (0 .. total_param_number).each do
          @pre.total_cost = @pre.total_cost + @product.price
        end
      end
      @pre.save

      if @pre.update(prescription_params)
        redirect_to select_lens_path
      else
         flash.now[:alert] = @product.errors.full_messages.to_sentence
         render :enter_pre
      end

  end

  def select_len

    if session[:order_id] and Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).present?
      pres = Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i)
    else
      pres = Presciption.where(:pre_token => session[:pre_token])
    end

    @pre = Presciption.find(pres.last.id)
    @product = Product.find(@pre.product_id)
  end

  def update_pre

    if session[:order_id] and Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).present?
      @pre = Presciption.where(:product_id => session[:product_id], :order_id => session[:order_id].to_i).last
    else
      pres = Presciption.where(:pre_token => session[:pre_token])
      @pre = Presciption.find(pres.last.id)
    end
        @pre.update(prescription_params)
        @order = current_order
        @pre.order_id =  @order.id
        @pre.save
        session[:order_id] = @order.id

        session[:pre_token] = nil
        redirect_to cart_path
  end

  def destroy
    @order = current_order
    @order_line = @order.presciptions.find(params[:id])
    @order_line.destroy
    session[:pre_token] = nil
    flash[:success] = I18n.t("item_removed")
    redirect_to cart_path
  end

  private

  def prescription_params
    params.require(:presciption).permit(:sphere, :cylinder, :axis, :add, :pd,
                                         :sphere_right, :cylinder_right,:axis_right, :lense_type, :add_right,:pd_right,
                                         :customer_id, :pre_token, :pre_type, :total_cost, :qty, :protective_coating,
                                         :scratch_resistant_coating, :anti_reflective_coating, :cost)
  end

end
