class Admin::CategoriesController < ApplicationController

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

  def index
    @categories = Category.all
    render json: @categories
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end