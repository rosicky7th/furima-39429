FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { 'さいたま市' }
    addresses { '1-1' }
    building { '埼玉ハイツ' }
    phone_number { '09000000000' }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
