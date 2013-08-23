# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :selection_process do
    description "Lorem ipsum"
    year 2013
    semester 1
    edict File.new(Rails.root + 'spec/support/edictTest.pdf')
    enterprise FactoryGirl.build(:enterprise)
  end
end
