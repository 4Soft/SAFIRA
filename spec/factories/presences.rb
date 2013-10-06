# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presence do
    present false
    event nil
    entrepreneur nil
  end
end
