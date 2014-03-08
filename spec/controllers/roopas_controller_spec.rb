require 'spec_helper'

describe RoopasController do

  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    d1=FactoryGirl.build(:dhatu_with_two_roopas)
    d1.save
  end

  context "Validate Roopas Show Action" do

    it "should return to root path" do
      get :show, {:r => '', :format => :json}
      expect(response).to render_template(root_path)
      get :show, {:r => 'abcd',:format => :json}
      expect(response).to render_template(root_path)
    end

    it "should return roopas description and details" do
      get :show, {:r => 'मोदते',:format => :json}
      expect(response).to render_template(root_path)
    end

    it "should support only JSON Format" do
      get :show, {:r => 'भवति'}
      response.body.should=="Only JSON format supported"
    end

  end


end
