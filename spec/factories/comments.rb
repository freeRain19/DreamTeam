FactoryGirl.define do

  factory :comment do
    sequence :message do |n|
      "message #{n}  Ololo"
    end
  end
end