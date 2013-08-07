# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    public "MyText"
    private "MyText"
    candidate nil
    process_step nil
  end
end
