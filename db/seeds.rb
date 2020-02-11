# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
keenan = Walker.create(name: "Keenan", rating:"4")
cesar = Walker.create(name: "Cesar", rating: "4")
juan = Walker.create(name: "Juan", rating: "4")

ginger = User.create(name: "Ginger")
tony = User.create(name: "Tony")
patty = User.create(name: "Patty")

ginger_a = Appointment.create(user: ginger, walker: keenan)
tony_a = Appointment.create(user: tony, walker: cesar)
patty_a = Appointment.create(user: patty, walker: juan)
