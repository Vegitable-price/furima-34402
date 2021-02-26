FactoryBot.define do
  factory :address_purchase do
    post_number { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    street { '世田谷区' }
    building { '' }
    phone { '08048484987' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
