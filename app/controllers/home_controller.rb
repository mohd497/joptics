class HomeController < ApplicationController

  before_action :get_current_order_search

  def index
    @products_new_men = Product.where(:newarrivals => true, :category => "men")
    @products_new_kids = Product.where(:newarrivals => true, :category => "kids")
    @products_new_women = Product.where(:newarrivals => true, :category => "women")
    @products_best_men = Product.where(:bestselling => true, :category => "men")
    @products_best_women = Product.where(:bestselling => true, :category => "women")
    @products_best_kids = Product.where(:bestselling => true, :category => "kids")
    @products_popularbrand_men = Product.where(:popularbrand => true, :category => "men")
    @products_popularbrand_women = Product.where(:popularbrand => true, :category => "women")
    @products_popularbrand_kids = Product.where(:popularbrand => true, :category => "kids")
  end

  def helpcenter

  end

end
