FactoryGirl.define do
  factory :user do
    sequence (:email){|i| "email#{}@email.com"}
    password :password
    first_name "first_name"
  end
end