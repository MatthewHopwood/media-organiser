FactoryBot.define do
  factory :media_category do
    sequence(:name) { |n| "media_category#{n}" }
  end
end
