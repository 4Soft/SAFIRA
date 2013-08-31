# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
enterprise = Enterprise.create(name: "4Soft", password: "12345678", email: "4soft@4soft.com")

entrepreneur = Entrepreneur.new(name: "Heiseinberg",
 personal_email: "email@email.com", professional_email: "email@email.com")
entrepreneur.enterprise = enterprise
entrepreneur.save

