class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.all.count
    @category_count = Category.all.count
  end
end
