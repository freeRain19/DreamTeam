FactoryGirl.define do

  factory :post do
    sequence :content do |n|
      "Long long, very long post number #{n} "
    end

    factory :post_with_comments, :parent => :post do
      after(:create) do |post|
        FactoryGirl.create(:comment, :post => post)
      end
    end
  end
end
