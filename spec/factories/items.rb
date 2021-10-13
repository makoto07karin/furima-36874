FactoryBot.define do
  factory :item do

    item             {'ねこ・猫・子猫'}
    price            {'3333'}
    item_info        {'この商品の説明の文？'}

    category_id      {'4'}
    item_state_id    {'2'}
    delivery_id      {'3'}
    area_id          {'4'}
    shipping_id      {'3'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
