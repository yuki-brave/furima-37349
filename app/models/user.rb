class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day_id, presence: true
  # 半角英数字混合
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # 全角カタカナ
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

  has_many :items
end
