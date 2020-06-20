FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"木下"}
    first_name            {"花"}  
    family_name_kana      {"キノシタ"}
    first_name_kana       {"ハナ"}


    birth_year            {1999}
    birth_month           {1}
    birth_day             {1}
    post_code             {"111-1111"}
    prefecture_code       {"東京都"}
    city                  {"渋谷区"}
    house_number          {"1ー1ー1"}
  end

end