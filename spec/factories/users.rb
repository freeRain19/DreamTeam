FactoryGirl.define do


  sequence :email do |n|
    "person#{n}@examples.com"
  end
  sequence :role_id do |q|
    if q==1
      return 1
    end
  end


  factory :user do
    email
    password 'password'
    first_name 'first_name'
    last_name 'last_name'

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



