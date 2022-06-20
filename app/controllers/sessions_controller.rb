class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # ログインの処理を書く
  end

  def destroy
    # ログアウトの処理を書く
    redirect_to root_url
  end
end
