class HomeController < ApplicationController
  before_action:already_login?,only:[:new,:create]
  # before_action:login?,only: :show
  def top
    # 仮の入力
    @users=User.all
  end
  # 新規ユーザー作成
  def new
    @user = User.new
  end
  # 新規ユーザー登録

  def create
    #userモデルを初期化
    @user=User.new(user_params)
    # userモデルをDBへ保存
    if @user.save
      # session[:user_id]=@user.id
    # showへリダイレクト
      redirect_to home_path(@user.id),notice:"新規ユーザーを登録しました"
    else
      # flash.now[:alert] = "登録に失敗しました"
      render 'new',status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  # ユーザー編集
  # def edit
  #   @user = User.find(params[:id])
  # end
  # ユーザー編集登録
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to ('/patients')
  #   else
  #     render 'edit', status: :unprocessable_entity
  #   end
  # end
  
  private
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
