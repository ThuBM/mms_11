FactoryGirl.define do
  factory :position do
    sequence(:name){|n| "Position Framgia #{n}"}
    sequence(:abbreviation){|n| "PF#{n}"}
  end
end
