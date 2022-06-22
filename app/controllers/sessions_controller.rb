class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in @user
      flash[:success] = "ログインしました。"
      if @user.admin?
        redirect_to root_url
      else
        redirect_to @user
      end
    else
      # エラーメッセージを作成する
      render 'new'
    end
  end

  def destroy
    # ログアウトの処理を書く
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
end
