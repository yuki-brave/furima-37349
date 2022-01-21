FactoryBot.define do
  factory :purchase_destination do
    post_code              { '111-1111' }
    shipping_prefecture_id { Faker::Number.within(range: 2..48) }
    city                   { Faker::Address.city }
    address                { '1-1' }
    building               { 'ビル' }
    phone_number           { '09012345678' }
    token                  { "tok_abcdefghijk00000000000000000" }
  end
end
