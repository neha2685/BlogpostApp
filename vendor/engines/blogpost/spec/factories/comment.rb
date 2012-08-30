FactoryGirl.define do
  factory :comment, :class=> Blogpost::Comments do |f|
    f.body "asd"
  end
end