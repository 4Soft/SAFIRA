# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :process_step do
    description "MyText"
    name "MyString"
    open_date "2013-08-02 13:23:32"
    consolidated_at "2013-08-02 13:23:32"
  end
end
