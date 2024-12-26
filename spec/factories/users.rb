FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
      email {Faker::Internet.email}
      password {'1a' + Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      last_name {"鈴木"}
      first_name {"太郎"}
      last_name_kana {"スズキ"}
      first_name_kana {"タロウ"}
      birthday {Faker::Date.between(from: '1900-01-01', to: '2023-12-31')}
  end
end
