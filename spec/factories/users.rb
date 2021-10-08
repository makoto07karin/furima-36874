FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end

#ここがモデルのバリデーションにあたると考える
#Fakerの機能はチェックできた
#family_name
#name
#family_kana
#kana
#date