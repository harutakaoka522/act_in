FactoryBot.define do
    factory :user do
      name { 'テストユーザー' }
      email { 'test@test.com' }
      password { '123456' }
    end
    factory :two_user, class: User do
      name { 'テストユーザー2' }
      email { "test2@test.com" }
      password { "123456" }
    end
    factory :three_user, class: User do
      name { 'テストユーザー3' }
      email { "test3@test.com" }
      password { "123456" }
    end
  end