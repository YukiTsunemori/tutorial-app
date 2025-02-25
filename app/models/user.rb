class User < ApplicationRecord
  # 渡された属性が存在することを検証します
  before_save { self.email = email.downcase }
  validates :name, presence:  true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  # このメソッドを使えば、DB内のpassword_digest属性に保存できる。
  # passwordとpassword_confirmationが使える。
  # authenticateメソッドが使える。

  # authenticateメソッドは、引数に渡された文字列（パスワード）を
  # ハッシュ化した値と、DB内にあるpassword_digestカラムの値を比較します。
  # 失敗した時の戻り値はfalseだが、正しいパスだとユーザオブジェクトを返すようになる。
  # しかしながら、authenticateがオブジェクトを返すことが重要ではなく、
  # trueを返すことが重要。
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
