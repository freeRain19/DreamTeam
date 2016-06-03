FactoryGirl.define do




  factory :team do
    sequence :name do |n|
      "Team #{n} "

      #projects
    end
  end




  factory :team_with_users , :parent => :team do
    transient do
      users_count 3
    end
    after(:create) do |team, evaluator|
      create_list(:user, evaluator.users_count, :team =>team)
    end
  end



end