FactoryGirl.define do

  factory :comment do
    sequence :message do |n|
      "This is a big big comment #{n} to post  Olololo"
    end
  end
end