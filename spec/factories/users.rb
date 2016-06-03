FactoryGirl.define do


  sequence :email do |n|
    "person#{n}@example.com"
  end


  factory :user do
    email
    password 'password'
    first_name 'first_name'
    last_name 'last_name'
    #association(:team)
  end

  factory :user_with_tasks, :parent => :user do
    transient do
      tasks_count 5
    end
    after(:create) do |user, evaluator|
      create_list(:task, evaluator.tasks_count, user: user)
    end
  end
end



