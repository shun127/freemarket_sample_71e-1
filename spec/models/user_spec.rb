require 'rails_helper'
describe User do
  describe '#create' do
    # it "nicknameがない場合は登録できないこと" do
    #   user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank")
     
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

  end
end



# ＊＊＊＊＊＊＊＊＊＊＊＊
# nickname、email、passwordとpassword_confirmationが存在すれば登録できること
# nicknameがない場合は登録できないこと
# emailがない場合は登録できないこと
# passwordがない場合は登録できないこと
# passwordが存在してもpassword_confirmationがない場合は登録できないこと
# nicknameが7文字以上であれば登録できないこと
# nicknameが6文字以下では登録できること
# 重複したemailが存在する場合登録できないこと
# passwordが6文字以上であれば登録できること
# passwordが5文字以下であれば登録できないこと
# ＊＊＊＊＊＊＊＊＊＊＊＊

## ユーザー登録時のビジネスルール（求められる仕様）
# - ユーザー情報
#  - ニックネームが必須
#  - メールアドレスは一意である
#  - メールアドレスは@とドメインを含む必要がある
#  - パスワードが必須
#  - パスワードは7文字以上
#  - パスワードは確認用を含めて2回入力する
# - 本人確認情報
#  - ユーザー本名が、名字と名前でそれぞれ必須
#  - ユーザー本名は全角で入力させる
#  - ユーザー本名のふりがなが、名字と名前でそれぞれ必須
#  - ユーザー本名のふりがなは全角で入力させる
#  - 生年月日が必須
# - 商品送付先住所情報
#  - 送付先氏名が、名字と名前でそれぞれ必須
#  - 送付先氏名のふりがなが、名字と名前でそれぞれ必須
#  - 郵便番号が必須
#  - 都道府県が必須
#  - 市区町村が必須
#  - 番地が必須
#  - マンション名やビル名、そしてその部屋番号は任意
#  - お届け先の電話番号は任意
