FactoryBot.define do
  factory :media_file do
    sequence(:name) { |n| "media_file#{n}" }
    file_path { "MyString" }
    media_type
    image

    trait :with_full_details do
      comment { "MyString" }
    end

    transient do
      add_media_categories { false }
    end

    after(:build) do |media_file, evaluator|
      if media_file.media_categories.empty? && evaluator.add_media_categories
        media_file.media_categories = build_list(:media_category, 1)
      end
    end
  end
end
