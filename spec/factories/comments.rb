FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    post
    user
  end
end
