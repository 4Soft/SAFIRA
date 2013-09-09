# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :enterprise do
    sequence(:name) { |i| "Enterprise #{i}m" }
    sequence(:email) { |i| "enterprise#{i}@gmail.com" }
    password '12345678'

    factory :four_soft do
      email '4soft@gmail.com'
      name '4Soft'
      about 'Lorem ipsum'
    end
  end
end
