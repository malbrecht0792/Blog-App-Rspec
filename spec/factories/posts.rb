FactoryBot.define do
  factory :post do
    association :user
    title "My Post"
    article "This is my first post!"

    factory :invalid_title do
      title nil
    end

    factory :invalid_article do
      article nil
    end
  end
end
