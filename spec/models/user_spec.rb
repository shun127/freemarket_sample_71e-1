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

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
    
    it "post_codeがない場合は登録できないこと" do
      user = build(:user, post_code: "")
      user.valid?
      expect(user.errors[:post_code]).to include("can't be blank")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      user = build(:user, prefecture_code: "")
      user.valid?
      expect(user.errors[:prefecture_code]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end


    

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end
  
    it "nicknameが6文字以下では登録できること" do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid  
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  
    it 'family_nameが全角であること' do
      user = build(:user, family_name: "ｶﾅ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください")
    end
  
    # it "xxxxxxxxxxxxxx" do
   
    # end


   


  end
end


# it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
#   user = build(:user)
#   expect(user).to be_valid
# end


# nickname、email、passwordとpassword_confirmation・・・・・・（全ての必須項目入れる）が存在すれば登録できること


# *********************


#  - メールアドレスは@とドメインを含む必要がある

#  - ユーザー本名は全角で入力させる

#  - ユーザー本名のふりがなは全角で入力させる
#
#  - マンション名やビル名、そしてその部屋番号は任意
#  - お届け先の電話番号は任意
