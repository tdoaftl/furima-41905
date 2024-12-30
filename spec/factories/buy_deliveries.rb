FactoryBot.define do
  factory :buy_delivery do
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
    postcode { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Lorem.sentence }
    address  { Faker::Lorem.sentence  }
    building  { Faker::Lorem.paragraph }
    phonenumber  { Faker::Number.between(from: 1000000000, to: 99999999999) }

  end
end
