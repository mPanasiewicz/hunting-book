# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contact.destroy_all
contacts = []

1.upto(20) do |i|
  new_contact = {
                  id: i,
                  name: FFaker::Name.name,
                  email: FFaker::Internet.email,
                  address: "#{FFaker::Address.street_name} #{FFaker::Address.building_number}, #{FFaker.numerify('##-###')} #{FFaker::Address.city}",
                  phone: FFaker.numerify('###-###-###').to_s
  }
  contacts.push(new_contact)
end

Contact.create(contacts)
Contact.connection.execute('ALTER SEQUENCE contacts_id_seq RESTART WITH 21')
