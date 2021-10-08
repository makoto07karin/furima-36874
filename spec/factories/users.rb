FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'佐藤'}
    name                  {'ミキ'}
    family_kana           {'サトウ'}
    kana                  {'ミキ'}
    date                  {'2000-10-24'}
  end
end

#ここがモデルのバリデーションにあたると考える
#Fakerの機能はチェックできた




