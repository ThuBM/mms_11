FactoryGirl.define do
  factory :project do
    sequence(:name){|n| "Project Framgia #{n}"}
    sequence(:abbreviation){|n| "PF#{n}"}
  end
end
