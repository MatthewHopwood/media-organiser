FactoryBot.define do
  factory :playlist do
    sequence(:name) { |n| "playlist#{n}" }
  end
end
