# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Padam.create!([{name: 'परस्मैपदम्'},{name: 'आत्मनेपदम्'}]);
Vachanam.create!([{name: 'एकवचनम्'},{name: 'द्विवचनम्'},{name: 'बहुवचनम'}]);
Purusha.create!([{name: 'प्रथमपुरुष:'},{name: 'मध्यमपुरुष:'},{name: 'उत्तमपुरुष:'}]);
Lakaras.create!([{name: 'लट्'},{name: 'लिट्'},{name: 'लुट'},{name: 'लृट्'},{name: 'लोट्'},
               {name:'लङ्'},{name:'विधिलिङ्'},{name:'आशिर्लिङ्'},{name:'लुङ्'},{name:'लृङ्'}])
User.create!({name: "Srikanth", email: "sriki77@gmail.com", password: "sriki", password_confirmation: "sriki"})