FactoryBot.define do
  factory :user do
    name {"test_user"}
    sequence(:mail) { |n| "abc#{n}@example.com"}
    password {'test1234TEST'}
    password_confirmation {'test1234TEST'}
  end
end
