FactoryBot.define do
  factory :user do
    username "johndoe"
    email "johndoe@example.com"

    factory :invalid_username do
      username nil
    end
    
    factory :invalid_email do
      email nil
    end
  end
end
