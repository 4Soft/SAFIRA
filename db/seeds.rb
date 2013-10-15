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

enterprise2 = Enterprise.create(name: "4Soft2", password: "12345678", 	email: "4Soft2@4soft.com")

entrepreneur2 = Entrepreneur.new(name: "Pinkman",
 personal_email: "email2@email.com", professional_email: "email2@email.com")
entrepreneur2.enterprise = enterprise2
entrepreneur.save