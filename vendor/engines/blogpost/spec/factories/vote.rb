FactoryGirl.define do
  factory :vote, :class=> Blogpost::Vote do |f|
    f.value 1
  end
end