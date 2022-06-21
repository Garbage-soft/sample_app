class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "新しい商品を登録しました。"
      redirect_to root_url
      # redirect_to product_url(@product)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品情報を変更しました。"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "商品情報を削除しました。"
    redirect_to products_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :stock, :description)
    end
end
