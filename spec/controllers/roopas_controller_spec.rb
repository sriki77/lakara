require 'spec_helper'

describe RoopasController do

  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    d1=FactoryGirl.build(:dhatu_with_two_roopas)
    d1.save
  end

  context "Validate Roopas Show Action" do

    it "should return to root path" do
      get :show, {:id=>''}
      expect(response).to redirect_to(root_path)
      get :show, {:id=>'abcd'}
      expect(response).to redirect_to(root_path)
    end

    it "should return roopas description and details" do
      get :show, {:id=>'मोदते'}
      expect(response).to render_template(:show)
    end

  end


end