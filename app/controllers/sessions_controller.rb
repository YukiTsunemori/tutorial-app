class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログインの直前に必ずこれを書くこと。セッション固定攻撃への対策。
      reset_session
      # セッションへ保存された情報を呼び出す
      log_in user
      # redirect_to user_url(user)と同じ
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination"
      # flash[:danger]だけだと、テストは失敗する。
      # なぜなら、render "new"は新しいリクエストではなく、描画しているだけなので、消えない。
      # これを解消するには、flash.nowメソッドを使って、レンダリングが終わっているページで特別にフラッシュメッセージを表示することができます。
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
      log_out # ヘルパーファイルでメソッドを定義しているので、ここで使用できる
      redirect_to root_url, status: :see_other
  end
end
