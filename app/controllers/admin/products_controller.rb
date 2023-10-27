class Admin::ProductsController < ApplicationController

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
  
  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
