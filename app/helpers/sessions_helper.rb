module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  # 現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザーがログイン中とは、「sessionにユーザーidが存在している」こと、
  # つまり、「current_userがnilではない」状態のこと。
  # ユーザーがログインしていればtrue,その他ならfalseを返すメソッドになる。
  def logged_in?
    !current_user.nil?
    # current_userがnilならtrueが返るので、falseを返すようにする => 否定演算子の!
    # current_userがnil出ない場合は、falseが返るので「!」でtrueが返るようにする。
  end
end
