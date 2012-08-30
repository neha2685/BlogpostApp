FactoryGirl.define do
  factory :user, :class=> Blogpost::User do |f|
    f.name "asd"
    f.email "asd@asd.com"
  end
end