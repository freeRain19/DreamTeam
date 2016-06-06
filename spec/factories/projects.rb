FactoryGirl.define do
  sequence :name do |n|
    if n%2==0
      "large Project ##{n}"
    elsif n%3==0
      "mini-project #{n}"
      else "easy project ##{n}"
    end

  end

  sequence :summary do |n|
    if n%2==0
    "a lot of  information #{n}"
    else
      "litle information #{n}"
    end
  end

  factory :project do
    name
    summary
    start_date Date.current+1
    end_date Date.current+10

  end

  factory :project_with_tasks, :parent => :project do
    transient do
      tasks_count 3
    end
    after(:create) do |project, evaluator|
      create_list(:task, evaluator.tasks_count, :project => project)
    end
  end
end
