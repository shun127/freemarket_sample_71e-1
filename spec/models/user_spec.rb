require 'rails_helper'
describe User do
  describe '#create' do
     
    # 必須項目のチェック
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    
    it "post_codeがない場合は登録できないこと" do
      user = build(:user, post_code: "")
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      user = build(:user, prefecture_code: "")
      user.valid?
      expect(user.errors[:prefecture_code]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end


    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    #文字数制限のある項目のチェック    
    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
   
      expect(user.errors[:nickname]).to include("は6文字以内で入力してください")
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

    # 一意性のチェック
    it "重複したemailが存在する場合登録できないこと" do      
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  

    # family_name（苗字）は全角ひらがな・漢字・カタカナであること
    it 'family_nameが全角であること（半角カナではない）' do
      user = build(:user, family_name: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it 'family_nameが全角であること（半角英語ではない）' do
      user = build(:user, family_name: "aa")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end
 
    it 'family_nameが全角であること（半角数字ではない）' do
      user = build(:user, family_name: "11")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end
 
    it 'family_nameが全角であること（全角数字ではない）' do
      user = build(:user, family_name: "２２２")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end
 
    it 'family_nameが全角ひらがなであれば登録できる' do
      user = build(:user, family_name: "ああ")     
      expect(user).to be_valid 
    end
   
    it 'family_nameが全角漢字であれば登録できる' do
      user = build(:user, family_name: "嗚呼")     
      expect(user).to be_valid 
    end

    it 'family_nameが全角カタカナであれば登録できる' do
      user = build(:user, family_name: "アア")     
      expect(user).to be_valid 
    end



    # first_name（名前）は全角ひらがな・漢字・カタカナであること
    it 'first_nameが全角であること（半角カナではない）' do
      user = build(:user, first_name: "ｲｲ")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it 'first_nameが全角であること（半角英語ではない）' do
      user = build(:user, first_name: "ee")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it 'first_nameが全角であること（半角数字ではない）' do
      user = build(:user, first_name: "11")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it 'first_nameが全角であること（全角数字ではない）' do
      user = build(:user, first_name: "１１")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it 'first_nameが全角ひらがなであれば登録できる' do
      user = build(:user, first_name: "ああ")     
      expect(user).to be_valid 
    end

    it 'first_nameが全角漢字であれば登録できる' do
      user = build(:user, first_name: "嗚呼")     
      expect(user).to be_valid 
    end

    it 'first_nameが全角カタカナであれば登録できる' do
      user = build(:user, first_name: "アア")     
      expect(user).to be_valid 
    end



    # family_name_kana（苗字ふりがな）は全角カタカナのみ
    it 'family_name_kana,が全角カタカナであること（半角カナではない）' do
      user = build(:user, family_name_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name_kana,]).to include("は不正な値です")
    end

    it 'family_name_kana,が全角カタカナであること（ひらがなではない）' do
      user = build(:user, family_name_kana: "ああ")
      user.valid?
      expect(user.errors[:family_name_kana,]).to include("は不正な値です")
    end

    it 'family_name_kana,が全角カタカナであること（全角英語ではない）' do
      user = build(:user, family_name_kana: "ｒｑ")
      user.valid?
      expect(user.errors[:family_name_kana,]).to include("は不正な値です")
    end

    it 'family_name_kana,が全角カタカナであること（半角英語ではない）' do
      user = build(:user, family_name_kana: "aa")
      user.valid?
      expect(user.errors[:family_name_kana,]).to include("は不正な値です")
    end

    it 'family_name_kana,が全角カタカナであること（数字ではない）' do
      user = build(:user, family_name_kana: "22")
      user.valid?
      expect(user.errors[:family_name_kana,]).to include("は不正な値です")
    end

    it 'family_name_kanaが全角カタカナであれば登録できる' do
      user = build(:user, family_name_kana: "アア")     
      expect(user).to be_valid 
    end



    # first_name_kana（名前ふりがな）は全角カタカナのみ
    it 'first_name_kanaが全角カタカナであること（半角カナではない）' do
      user = build(:user, first_name_kana: "ｲｲ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナであること（ひらがなではない）' do
      user = build(:user, first_name_kana: "いい")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナであること（全角英語ではない）' do
      user = build(:user, first_name_kana: "ｒｑ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナであること（半角英語ではない）' do
      user = build(:user, first_name_kana: "EE")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナであること（数字ではない）' do
      user = build(:user, first_name_kana: "11")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナであれば登録できる' do
      user = build(:user, first_name_kana: "イイ")     
      expect(user).to be_valid 
    end

  end
end




