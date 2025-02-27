class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    # 空のインスタンス（オブジェクト）を生成。
    # newアクションが呼ばれた時、new.html.erbへインスタンス変数として渡される。
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flashは特殊な変数
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
      # redirect_to user_path(@user)と同等
    else
      render "new", status: :unprocessable_entity
      # HTTPリクエストの422 Unprocessable Entityに対応するもの。
    end
  end

  private
   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
