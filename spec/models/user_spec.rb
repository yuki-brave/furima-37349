require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages ).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'emailには@を含まないと登録できない' do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "11111"
      @user.password_confirmation = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合での入力しないと登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.last_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank","First name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = "ｱｲｳｴｵ"
      @user.first_name = "ｶｷｸｹｺ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.last_name_kana = ""
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = "ｱｲｳｴｵ"
      @user.first_name_kana = "ｶｷｸｹｺ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
    end
    it '生年月日が必須であること' do
      @user.birth_day_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
