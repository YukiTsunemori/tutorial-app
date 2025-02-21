class StaticPagesController < ApplicationController
  def home
    # 仮に指定するviewがない場合、デフォルトで
    # =>app/views/static_pages/home.html.erbが読み込まれる
  end

  # app/views/コントローラ名/アクション名.html.erbがデフォルトで呼ばれる

  def help
  end
end
