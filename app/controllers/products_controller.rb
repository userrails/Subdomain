class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    products
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = products.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = products.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

private
  
  def products
    @products ||= current_login.products
  end

  def set_product
    @product = products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name)
  end
end