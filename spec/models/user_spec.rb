require 'rails_helper'
RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user) 
  end

  describe '新規登録' do
    context  '正常系' do 
      it 'nicknameとemailとpasswordとfamily_nameとnameとfamily_kanaとkanaとdateが存在するば登録できる'do
        expect(@user).to be_valid
      end
    end


    context '異常系' do 
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
      it 'emailが@を含まないと登録できない' do
        @user.email = '11hhugmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
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
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'jfaisgmailcom'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '1111@1123199'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角文字のみでは登録できない' do
        @user.password = 'HIOIH＠GMAIL.COM'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが数字では登録できない' do
        @user.family_name = '0123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'family_nameが小文字のアルファベットでは登録できない' do
        @user.family_name = 'qwertyuiopa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'family_nameが大文字のアルファベットでは登録できない' do
        @user.family_name = 'QWERTYU'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'nameが数字では登録できない' do
        @user.name = '0123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが小文字のアルファベットでは登録できない' do
        @user.name = 'qwertyui'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'nameが大文字のアルファベットでは登録できない' do
        @user.name = 'QWERTYU'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'family_kanaが数字では登録できない' do
        @user.family_kana = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'family_kanaが小文字のアルファベットでは登録できない' do
        @user.family_kana = 'qwertyui'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'family_kanaが大文字のアルファベットでは登録できない' do
        @user.family_kana = 'QWERRTY'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'family_kanaが漢字では登録できない' do
        @user.family_kana = '月見里'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'family_kanaがひらがなでは登録できない' do
        @user.family_kana = 'やまなし'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end
      it 'kanaが空では登録できない' do
        @user.kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana can't be blank")
      end
      it 'kanaが数字では登録できない' do
        @user.kana = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaが小文字のアルファベットでは登録できない' do
        @user.kana = 'qwertyu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaが大文字のアルファベットでは登録できない' do
        @user.kana = 'QWERTYUIOP'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaが漢字では登録できない' do
        @user.kana = '一二三'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaがひらがなでは登録できない' do
        @user.kana = 'ひふみ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'dateが空では登録できない' do
        @user.date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end

