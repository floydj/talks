FactoryGirl.define do
  factory :outline do
    sequence(:title) { |n| "Talk Title#{n}" }
    sequence(:number) { |n| n }
  end

end
