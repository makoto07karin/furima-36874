require 'rails_helper'
RSpec.describe User, type: :model do
  before do #1
    @user = FactoryBot.build(:user) #2
  end

  describe '新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
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
      expect(@user.errors.full_messages).to include("Family name can't be blank")#3
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

#1ここでインスタンスをコントローラーで記述する感じ？
#2user = FactoryBot.build(:user)が
#user = User.new(nickname: 'test', email: 'test@example'）と同じ記述になる
#3 include("Family name can't be blank")ここでは、（）の頭は大文字でアンダーバーは無し！