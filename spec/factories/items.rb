FactoryBot.define do
  factory :item do
    name               { 'j' }
    price              { 999_999 }
    prefecture_id      { 1 }
    ship_day_id        { 2 }
    status_id          { 2 }
    describe           { 'j' }
    genre_id           { 2 }
    ship_fee_id        { 3 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
