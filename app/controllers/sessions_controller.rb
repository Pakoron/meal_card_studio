class SessionsController < ApplicationController
  before_action:already_login?, except: :destroy
  
  
  def new
  end
  
  def create
    @user=User.find_by_id(params[:id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] =@user.id
      redirect_to patients_path,notice:"ログインしました"
    else
      flash.now[:alert] = "ユーザーIDかパスワードに誤りがあります"
      render :new,status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to root_path,notice:"ログアウトしました"
  end
  
  
  
end
