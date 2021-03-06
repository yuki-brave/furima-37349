FactoryBot.define do
  factory :item do
    title                  { Faker::Lorem.word }
    text                   { Faker::Lorem.sentence }
    price                  { Faker::Number.number(digits: 4) }
    category_id            { Faker::Number.within(range: 2..11) }
    condition_id           { Faker::Number.within(range: 2..7) }
    shipping_cost_id       { Faker::Number.within(range: 2..3) }
    shipping_prefecture_id { Faker::Number.within(range: 2..48) }
    shipping_days_id       { Faker::Number.within(range: 2..4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/images/タスク着手順序.png'), filename: 'タスク着手順序.png')
    end
  end
end
