class CreditCard < ApplicationRecord  
  validates :customer_id, :card_id, presence: true
end
