FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User #{n}"
    end
    sequence :email do |n|
      "user.example#{n}@gmail.com"
    end
    password "thisispassword"
    password_confirmation "thisispassword"
    role "admin"
  end
end
