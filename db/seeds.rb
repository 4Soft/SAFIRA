# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
enterprise = Enterprise.create(name: "4Soft", password: "12345678", email: "4soft@4soft.com")

sel = SelectionProcess.new(year: 2013, semester: 2)
sel.enterprise = enterprise
sel.save

step = ProcessStep.new(name: "Entrevista")
step.selection_process = sel
step.save

cand = Candidate.new(name: "Jao", email: "painkiller778@gmail.com")
cand.selection_process = sel
cand.process_steps << step
cand.save

feedback = Feedback.new(public: "Como vc eh burro cara...", private: "huehuehueheuhe")
feedback.candidate = cand
feedback.process_step = step
feedback.save