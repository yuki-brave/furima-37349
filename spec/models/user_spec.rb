require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailには@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'ABCD12'
        @user.password_confirmation = 'ABCD12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'お名前(全角)のlast_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'お名前(全角)のfirst_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'お名前(全角)のlast_nameが半角では登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it 'お名前(全角)のfirst_nameが半角では登録できない' do
        @user.first_name = 'ｶｷｸｹｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'お名前カナ(全角)のlast_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)を入力してください')
      end
      it 'お名前カナ(全角)のfirst_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
      it 'お名前カナ(全角)のlast_name_kanaが半角（カタカナ）では登録できない' do
        @user.last_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)は不正な値です')
      end
      it 'お名前カナ(全角)のfirst_name_kanaが半角（カタカナ）では登録できない' do
        @user.first_name_kana = 'ｶｷｸｹｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
      end
      it '生年月日が必須であること' do
        @user.birth_day_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
