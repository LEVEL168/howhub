require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
          it "内容に問題ない場合" do
            expect(@user).to be_valid
          end
          it 'nameが100文字以下のユーザーが作成可能' do
            @user.name = 'a' * 99
            expect(@user).to be_valid
          end
          it 'emailが255文字以下のユーザーが作成可能' do
            @user.mail = 'a' * 245 + '@sample.jp'
            expect(@user).to be_valid
          end
          it 'emailは全て小文字で保存される' do
            @user.mail = 'SAMPLE@SAMPLE.JP'
            @user.save!
            expect(@user.reload.mail).to eq 'sample@sample.jp'
          end
          it 'passwordが6文字以上かつ小文字/大文字/数字を全て含むユーザーが作成可能' do
            @user.password
            expect(@user).to be_valid
            @user.save!
          end
      end
      
      context '新規登録がうまくいかないとき' do
          it "nameが空だと登録できない" do
            user = build(:user, name: nil)
            expect(user).to be_invalid
            expect(user.errors[:name]).to eq ['を入力してください']
          end
          it 'nameが100文字以上のユーザーを許可しない' do
            @user.name = 'a' * 101
            @user.valid?
            expect(@user.errors).to be_added(:name, :too_long, count: 100)
          end
          it "mailが空では登録できない" do
            expect(FactoryBot.build(:user, mail: "")).to_not be_valid 
          end
          it "重複したemailが存在する場合登録できない" do
            user1 = create(:user,name: "taro", mail: "taro@example.com")
            expect(build(:user, name: "ziro", mail: user1.mail)).to_not be_valid
          end
          it 'mailが256文字以上のユーザーを許可しない' do
            @user.mail = 'a' * 246 + '@sample.jp'
            @user.valid?
            expect(@user.errors).to be_added(:mail, :too_long, count: 255)
          end
          it "passwordが空では登録できない" do
            expect(FactoryBot.build(:user, password: "")).to_not be_valid
          end
          it "passwordが5文字以下であれば登録できない" do
            expect(FactoryBot.build(:user, password: "abC12")).to_not be_valid
          end
          it "passwordが存在してもpassword_confirmationが空では登録できない" do
            expect(FactoryBot.build(:user, password: "test1234TEST",password_confirmation: "")).to_not be_valid
          end
          it "passwordが半角英数字混合かつ大文字がなければ登録できない" do
            expect(FactoryBot.build(:user, password: "000000")).to_not be_valid
          end
          it "passwordが全角であれば登録できない" do
            expect(FactoryBot.build(:user, password: "ああああああ")).to_not be_valid
          end
      end
  end
  
  describe 'パスワードの検証' do
    it 'パスワードと確認用パスワードが間違っている場合、無効であること' do
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid include("とパスワードの入力が一致しない")
    end

    it 'パスワードが暗号化されていること' do
      expect(@user.password_digest).to_not eq "password"
    end
  end
end


RSpec.describe 'ユーザー新規登録', type: :system do
  let(:user) { FactoryBot.create(:user) }
  
  describe 'ログイン' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in name="mail", with: user.mail
        fill_in name="password", with: user.password
        click_button 'ログイン'
      end
    end
  end
  
end