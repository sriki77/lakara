require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Srikanth"
    email "a@a.com"
    password "abc123"
    password_confirmation "abc123"
  end


  factory :dhatu_with_one_roopa, class: Dhatu do
    name "भ"
    association :padam, factory: :p_padam, strategy: :build
    after(:build) do |d|
      d.roopas = [FactoryGirl.build(:bhava_roopa)]
    end
  end

  factory :dhatu_with_two_roopas, class: Dhatu do
    name "मो"
    association :padam, factory: :a_padam, strategy: :build
    after(:build) do |d|
      d.roopas = [FactoryGirl.build(:bhava_roopa),FactoryGirl.build(:moda_roopa)]
    end
  end

  factory :bhu_dhatu_with_roopas, class: Dhatu do
    name "भू"
    association :padam, factory: :p_padam, strategy: :build
    after(:build) do |d|
      d.roopas = [FactoryGirl.build(:bhava_roopa), FactoryGirl.build(:bhavata_roopa)]
    end
  end

  factory :bhava_roopa, class: Roopa do
    name "भवति"
    association :lakaras, factory: :lat_lakara, strategy: :build
    association :vachanam, factory: :yeka_vachana, strategy: :build
    association :purusha, factory: :p_purusha, strategy: :build
  end

  factory :bhavata_roopa, class: Roopa do
    name "भवत"
    association :lakaras, factory: :lot_lakara, strategy: :build
    association :vachanam, factory: :bahu_vachana, strategy: :build
    association :purusha, factory: :m_purusha, strategy: :build
  end

  factory :moda_roopa, class: Roopa do
    name "मोदते"
    association :lakaras, factory: :lat_lakara, strategy: :build
    association :vachanam, factory: :yeka_vachana, strategy: :build
    association :purusha, factory: :p_purusha, strategy: :build
  end

  factory :p_padam, class: Padam do
    name "परस्मैपदी"
    initialize_with { Padam.find_by_name(name)}
  end

  factory :a_padam, class: Padam do
    name "आत्मनेपदी"
    initialize_with { Padam.find_by_name(name)}
  end

  factory :lat_lakara, class: Lakaras do
    name "लट्"
    initialize_with { Lakaras.find_by_name(name)}
  end

  factory :lot_lakara, class: Lakaras do
    name "लोट्"
    initialize_with { Lakaras.find_by_name(name)}
  end

  factory :yeka_vachana, class: Vachanam do
    name "एकवचनम्"
    initialize_with { Vachanam.find_by_name(name)}
  end

  factory :bahu_vachana, class: Vachanam do
    name "बहुवचनम"
    initialize_with { Vachanam.find_by_name(name)}
  end

  factory :p_purusha, class: Purusha do
    name "प्रथमपुरुष:"
    initialize_with { Purusha.find_by_name(name)}
  end

  factory :m_purusha, class: Purusha do
    name "मध्यमपुरुष:"
    initialize_with { Purusha.find_by_name(name)}
  end



end

#Padam.delete_all
#Padam.create!([{name: 'परस्मैपदम्'},{name: 'आत्मनेपदम्'}]);
#Vachanam.delete_all
#Vachanam.create!([{name: 'ऐकवचनम्'},{name: 'द्विवचनम्'},{name: 'बहुवचनम'}]);
#Purusha.delete_all
#Purusha.create!([{name: 'प्रथमपुरुष:'},{name: 'मध्यमपुरुष:'},{name: 'उत्तमपुरुष:'}]);
#Lakaras.delete_all
#Lakaras.create!([{name: 'लट्'},{name: 'लिट्'},{name: 'लुट'},{name: 'लृट्'},{name: 'लोट्'},
#                 {name:'लङ्'},{name:'विधिलिङ्'},{name:'आशिर्लिङ्'},{name:'लुङ्'},{name:'लृङ्'}])
