FactoryGirl.define do
  sequence :name do |n|
    "Project #{n}"
  end
  factory :project do
    name
    summary 'summary information'
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
