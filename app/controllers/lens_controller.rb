class LensController < ApplicationController

  def enter_pre

    @pre_type = [["Distance / Frames Only", "Distance / Frames Only"], ["Reading Lenses", "Reading Lenses"],
                 ["Bifocal Lenses", "Bifocal Lenses"], ["Progressive Lenses", "Progressive Lenses"]]

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

    if session[:pre_token]
      pres = Presciption.where(:pre_token => session[:pre_token])
      if pres.last.product_id != session[:product_id].to_i
        @pre = Presciption.new
        @pre_commit = true
      else
        @pre = Presciption.find(pres.last.id)
      end
    else
      @pre = Presciption.new
      @pre_commit = true
    end
  end

  def create
    @pre = Presciption.new(prescription_params)
    if @pre.save
      session[:pre_token] = Digest::SHA1.hexdigest([Time.now, rand].join)
      @pre.pre_token = session[:pre_token]
      @pre.product_id = session[:product_id].to_i
      @pre.save
      redirect_to select_lens_path
    else
      render :enter_pre
    end
  end

  def update
    pres = Presciption.where(:pre_token => session[:pre_token])
    @pre = Presciption.find(pres.last.id)
    if @pre.update(prescription_params)
      redirect_to select_lens_path
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :enter_pre
    end
  end

  def select_len
    pres = Presciption.where(:pre_token => session[:pre_token])
    @pre = Presciption.find(pres.last.id)
    @product = Product.find(pres.last.product_id)
  end

  private

  def prescription_params
    params.require(:presciption).permit(:sphere, :cylinder, :axis, :add, :pd,
                                         :sphere_right, :cylinder_right,:axis_right, :add_right,:pd_right,
                                         :customer_id, :pre_token, :pre_type)
  end

end
