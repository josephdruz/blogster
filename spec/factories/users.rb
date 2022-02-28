FactoryBot.define do
  factory :user do
    factory :valid_user do
      email { "test@user.com" }
      password { "password" }
      password_confirmation { "password" }
    end
    factory :invalid_user do
      email { "" }
      password { "" }
      password_confirmation { "" }
    end
  end
end
