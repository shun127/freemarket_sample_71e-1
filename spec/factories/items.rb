FactoryBot.define do

  factory :item do
    name                      {"abeb"}
    price                     {"1999"}
    item_introduction         {"コメント"}
    condition                 {"未使用"}                  
    postage_payers            {"着払い（購入者負担）"}
    prefecture_id             {"1"}
    preparation_period        {"4〜7日発送"}
    category {create(:category)}
  end

end