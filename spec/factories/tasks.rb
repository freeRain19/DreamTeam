FactoryGirl.define do
  sequence :title do |n|
    "Task #{n}"
  end
  factory :task do
    title
    status 'done'
    start_date Date.current+1
    due_date Date.current+10


  end

  factory :task_with_posts , :parent => :task do
    after(:create) do |task|
      FactoryGirl.create(:post_with_comments, :task =>  task)
    end
  end
end