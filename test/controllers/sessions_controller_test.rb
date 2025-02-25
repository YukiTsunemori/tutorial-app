require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    # ログイン用のパスを開く
    get login_path

    # 新たしいセッションのフォームが正しく表示されたことを確認する
    assert_template "sessions/new"

    # わざと無効なparamsハッシュを使ってセッション用パスにPOSTする
    post login_path, params: { session: { email: "", password: "" } }
    assert_response :unprocessable_entity

    # 新しいセッションのフォームが正しいステータスを返し、再度表示されることを確認する
    assert_template "sessions/new"

    # フラッシュメッセージが表示されることを確認する
    assert_not flash.empty?

    # 別のページ（Homeページなど） にいったん移動する
    get root_path

    # 別のページ（Homeページなど） にいったん移動する
    assert flash.empty?
  end
end
