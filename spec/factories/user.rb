FactoryBot.define do
  factory :user do
    first_name { "Jason" }
    last_name { "Mamoa" }
    email { "test@example.com" }
    password { "password" }
  end
end
