# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :selection_process do
    description "MyText"
    year 1
    semester 1
    edict ""
    open_date "2013-08-02 13:17:51"
    close_date "2013-08-02 13:17:51"
  end
end
