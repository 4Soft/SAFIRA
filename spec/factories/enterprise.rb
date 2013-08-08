# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user do
    email '4soft@gmail.com'
    name '4Soft'
    about 'Lorem ipsum'
    password '12345678'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :enterprise, parent: :user do
    corporate_name '4Soft Jr.'
    cnpj '16.011.561/0001-26'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end