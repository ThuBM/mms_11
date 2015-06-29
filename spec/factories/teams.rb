FactoryGirl.define do
  factory :team do
    sequence(:name) {|n| "Framgia team #{n}"}
    sequence(:description) {|n| "This is framgia team #{n}"}
    leader nil

    factory :team_with_leader do
      leader :leader
    end
  end
end
