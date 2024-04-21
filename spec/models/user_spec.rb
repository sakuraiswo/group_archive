require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、profileが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'profileが無くても登録できる' do
        profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')     
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")     
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers and be in half-width characters.')
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers and be in half-width characters.')
      end
      it 'passwordが全角を含んでいると登録できない' do
        @user.password = 'Ａaａ１1１'
        @user.password_confirmation = 'Ａaａ１1１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers and be in half-width characters.')
      end
      it 'passwordが半角でもカタカナでは登録できない' do
        @user.password = 'ｱｱｱｱｱｱ'
        @user.password_confirmation = 'ｱｱｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers and be in half-width characters.')
      end
    end
  end

end
