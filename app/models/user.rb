class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # ユーザー本名は全角で入力させる(全角ひらがな、全角カタカナ、漢字) 6/15木下
  validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/  }
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/  }
 
  
  # ユーザー本名のふりがなは全角で入力させる (全角カタカナ) 6/15木下      
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/  }
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/  }
  
  

  # メールアドレス@以降のドメイン必須 6/15木下
  validates :email, format: {with: /\A\S+@\S+\.\S+\z/ }

  # テストコード記述のため、app/views/devise/registrations/new.html.erbのmaxlength: 6記述を削除し、以下を追加6/18木下
  validates :nickname, presence: true, length: { maximum: 6 }



  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day ,:post_code ,:prefecture_code , :city, :house_number, presence: true
  # validates :email, uniqueness: true
 
end





# 前半のvalidates :content, presence: trueは、contentカラムが空の場合は保存しない、というバリデーションです。
# 後半で、unless: :image?という条件を追加しています。unlessはifの逆の役割があります。
# if: :image?であれば、imageカラムが空でなければという意味になりますので、unless: :image?はimageカラムが空だったらという意味です。
# つまり、imageカラムが空の場合、contentカラムも空であれば保存しないという意味になります。
# class Message < ApplicationRecord
#   belongs_to :group
#   belongs_to :user
#   validates :content, presence: true, unless: :image?
# end