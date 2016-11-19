# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Attendee.create([
  { email: 'aaron.cowdrey@cerner.com', first_name: 'Amos' , last_name: 'Moses', all_attendants: 'Amos Moses', party_count: '1', rsvp: false, is_attending: false, number_attending: 0 },
  { email: 'notanemail', first_name: 'Amos1' , last_name: 'Moses3', all_attendants: 'Amos Moses', party_count: '2', rsvp: false, is_attending: false, number_attending: 0 },
  { email: 'alsonotanemail', first_name: 'Amos2' , last_name: 'Moses2', all_attendants: 'Amos Moses', party_count: '3', rsvp: false, is_attending: false, number_attending: 0 }
  ])
