FactoryBot.define do
  factory :user do
    first_name            { '豊島' }
    last_name             { '川上' }
    first_name_kana       { 'カナ' }
    last_name_kana        { 'カタ' }
    birth_day             { '1930-01-02' }
    nickname              { 'たけし' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
