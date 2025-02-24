require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name:  "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end

    follow_redirect!
    # POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
    assert_template "users/show"
  end
end
