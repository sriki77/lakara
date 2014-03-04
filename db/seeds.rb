# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Padam.delete_all
Padam.create!([{name: 'परस्मैपदम्'},{name: 'आत्मनेपदम्'}]);
Vachanam.delete_all
Vachanam.create!([{name: 'ऐकवचनम्'},{name: 'द्विवचनम्'},{name: 'बहुवचनम'}]);
Purusha.delete_all
Purusha.create!([{name: 'प्रथमपुरुष:'},{name: 'मध्यमपुरुष:'},{name: 'उत्तमपुरुष:'}]);
Lakaras.delete_all
Lakaras.create!([{name: 'लट्'},{name: 'लिट्'},{name: 'लुट'},{name: 'लृट्'},{name: 'लोट्'},
               {name:'लङ्'},{name:'विधिलिङ्'},{name:'आशिर्लिङ्'},{name:'लुङ्'},{name:'लृङ्'}])

