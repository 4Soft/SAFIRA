# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    entrepreneur nil
    start_date "2013-09-14"
    end_date "2013-09-14"
    name "MyString"
  end
end
