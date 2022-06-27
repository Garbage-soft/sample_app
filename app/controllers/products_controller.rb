class ProductsController < ApplicationController
  before_action :logged_in_admin_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_admin_user,   only: [:edit, :update, :destroy]

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

    # 管理者がログイン済みかどうか確認
    def logged_in_admin_user
      unless admin_logged_in?
        flash[:danger] = "運営者アカウントでログインしてください。"
        redirect_to login_url
      end
    end

    # 管理者権限があるかどうか確認
    def correct_admin_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user.admin?
    end
end
