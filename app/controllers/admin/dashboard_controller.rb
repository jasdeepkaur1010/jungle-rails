class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['Jungle'], password: ENV['Book']
  def show
    @count_product = Product.count
    @count_category = Product.group(:category_id).count
  end
end
