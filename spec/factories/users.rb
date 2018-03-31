FactoryBot.define do
  factory :user do
    username "johndoe"
    email { Faker::Internet.email}
    password 'Password1'
    encrypted_password 'Password1'

    factory :invalid_username do
      username nil
    end
    
    factory :invalid_email do
      email nil
    end
  end
end