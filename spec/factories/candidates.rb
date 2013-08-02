# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    name "MyString"
    description "MyText"
    curriculum ""
    email "MyString"
    course "MyString"
  end
end
