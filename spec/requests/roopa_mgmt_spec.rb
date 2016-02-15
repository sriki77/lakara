require 'spec_helper'

describe "Roopa Retrievals" do

  before(:each) do
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
    response.body.should include('"roopa":"भवति","desc":"भू धातुः, परस्मैपदी"')
    response.body.should include('लट् लकार:, प्रथमपुरुष:, एकवचनम्"')
  end

  it "should return JSON for lot lakara" do
    get "/roopa", {:r => 'bhava', :format => :json}
    p response.body
    response.body.should include('"roopa":"bhava/bhavatat","desc":"भू धातुः, परस्मैपदी"')
    response.body.should include('लोट् लकार:, मध्यमपुरुष:, एकवचनम्"')
    get "/roopa", {:r => 'bhavatat', :format => :json}
    p response
    response.body.should include('"roopa":"bhava/bhavatat","desc":"भू धातुः, परस्मैपदी"')
    response.body.should include('लोट् लकार:, मध्यमपुरुष:, एकवचनम्"')
  end


  it "should return JSON for lot lakara again" do
    get "/roopa", {:r => 'abhava', :format => :json}
    p response
    response.body.should include('"roopa":"abhava / bh/ abhavatat","desc":"भू धातुः, परस्मैपदी"')
    response.body.should include('लोट् लकार:, मध्यमपुरुष:, एकवचनम्"')
    get "/roopa", {:r => 'bh', :format => :json}
    p response
    response.body.should include('"roopa":"abhava / bh/ abhavatat","desc":"भू धातुः, परस्मैपदी"')
    response.body.should include('लोट् लकार:, मध्यमपुरुष:, एकवचनम्"')
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
