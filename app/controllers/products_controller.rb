class ProductsController < ApplicationController
# applicationcontroller knows where is the activeRecord. 

  def index
    @products = Product.all.order(created_at: :desc)
    
  end

  def show
    @product = Product.find params[:id]
  end

end
