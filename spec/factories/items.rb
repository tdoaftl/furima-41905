FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explain {Faker::Lorem.paragraph}
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id  { Faker::Number.between(from: 2, to: 7) }
    shipping_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    day_id       { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
       item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
