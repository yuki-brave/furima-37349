class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day_id, presence: true


  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}

  # 全角ひらがな、全角カタカナ、漢字
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角にする必要があります'}
  

  # 全角カタカナ
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'は全角カタカナにする必要があります'}

end
# パスワードは、半角英数字混合での入力が必須であることのテストコード
# FactoryBot.define do
#   factory :user do
#     email                   { Faker::Internet.email}
#     password                { 'abcd1234' }
#     password_confirmation   { password }
#   end
# end