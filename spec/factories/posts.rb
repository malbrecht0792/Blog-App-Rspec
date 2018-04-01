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

    factory :fitness_post do
      title "Consistenly Exercising"
      article "13 keys to staying consistent at the gym..."
    end

    factory :health_post do
      title "Eating Right"
      article "11 ways to easily cut carbs..."
    end
  end
  factory :new_attributes, class: Post do
    title "My New Post"
    article "This is my new post!"
  end
end
