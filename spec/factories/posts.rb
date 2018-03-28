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

    factory :invalid_post do
      title nil
      article nil
    end

    factory :new_attributes do
      title "My New Post"
      article "This is my new post!"
    end
  end
end
