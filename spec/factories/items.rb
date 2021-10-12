FactoryBot.define do
  factory :item do

    item             {'ねこ・猫・子猫'}
    price            {'3333'}
    item_info        {'この商品の説明の文章が短いからエラーが出るのかもしれないんだけどどうよ？'}

    category_id      {'4'}#2
    item_state_id    {'2'}
    delivery_id      {'3'}
    area_id          {'4'}
    shipping_id      {'3'}

    association :user#1

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
#idの情報は、モデルを介して取得できるのでもしかして、アソシエーションを組まないと情報が取得できない？

#1なんでUserも必要？
#itemのテーブル上にはUserもあるから？

#2アソシエーションにする必要がないよ！
