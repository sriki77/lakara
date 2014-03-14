require 'spec_helper'

describe "Roopa Retrievals" do

  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    d1=FactoryGirl.build(:bhu_dhatu_with_roopas)
    d1.save
  end


  it "should support only JSON format " do
    get "/roopa", {:r => 'abcd'}
    response.body.should == "Only JSON format supported"
  end

  it "should return emty JSON when roopa is not found" do
    get "/roopa", {:r => 'abcd', :format => :json}
    response.body.should == "{}"
  end

  it "should return JSON for lat lakara" do
    get "/roopa", {:r => 'भवति', :format => :json}
    response.body.should include('"roopa":"भवति","desc":"भू धातु, परस्मैपदम्"')
    response.body.should include('लट् लाकर:, प्रथमपुरुष:, एकवचनम्"')
  end


end
#Padam.create!([{name: 'परस्मैपदम्'},{name: 'आत्मनेपदम्'}]);
#Vachanam.create!([{name: 'ऐकवचनम्'},{name: 'द्विवचनम्'},{name: 'बहुवचनम'}]);
#Purusha.create!([{name: 'प्रथमपुरुष:'},{name: 'मध्यमपुरुष:'},{name: 'उत्तमपुरुष:'}]);
#Lakaras.create!([{name: 'लट्'},{name: 'लिट्'},{name: 'लुट'},{name: 'लृट्'},{name: 'लोट्'},
#               {name:'लङ्'},{name:'विधिलिङ्'},{name:'आशिर्लिङ्'},{name:'लुङ्'},{name:'लृङ्'}])
#name "भ"
#name "भवति"
#name "भवत"
#name "मोदते"
