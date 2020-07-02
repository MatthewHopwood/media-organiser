FactoryBot.define do
  factory :media_type do
    sequence(:name) { |n| "media_type#{n}" }
  end
end
