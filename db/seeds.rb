FactoryGirl.define do
  factory :user do
    name "Duc"
    email "duc123@gmail.com"
    password "12345678"
    role "User"
  end
end

1.times do
  FactoryGirl.create :user
end
