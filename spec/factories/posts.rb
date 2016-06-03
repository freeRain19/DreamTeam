FactoryGirl.define do
  factory :post do
    content 'content'


  end

  factory :post_with_comments, :parent => :post do
    after(:create) do |post|
      FactoryGirl.create(:comment, :post => post)
    end
  end
end