class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV['Jungle'], password: ENV['Book']
  def http_basic_authenticate_or_request_with
    user = request.authorization&.username
    password = request.authorization&.password
  
    if user && password
      if User.exists?(username: user) && ActiveSupport::SecurityUtils.secure_compare(user.password, password)
        return true
      end
    end
  
    request_http_basic_authentication
  end
  
  def show
    @count_product = Product.count
    @count_category = Product.group(:category_id).count
  end
end
