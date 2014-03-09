require 'spec_helper'

describe UsersController do

  context "When Insufficient information" do

    it "should return 400 for missing users" do
      post :create
      response.response_code.should==400
    end

    it "should return 403 for missing users data" do
      post :create, {:users => {}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should_not be_nil
      res['name'].should_not be_nil
      res['password'].should_not be_nil
    end

    it "should return 403 for missing users name, password" do
      post :create, {:users => {:email => 'cooker@gmail.com'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should be_nil
      res['name'].should_not be_nil
      res['password'].should_not be_nil
    end

    it "should return 403 for missing users password" do
      post :create, {:users => {:email => 'cooker@gmail.com', :name => 'hawkings'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should be_nil
      res['name'].should be_nil
      res['password'].should_not be_nil
    end
  end

  context "When input is invalid" do

    it "should return 403 if users name length is invalid" do
      post :create, {:users => {:name => 'a', :email => 'a@a.com', :password => 'p', :password_confirmation => 'p'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['name'].should_not be_nil
      post :create, {:users => {:name => 'c_b_c', :email => 'a@a.com', :password => 'p', :password_confirmation => 'p'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['name'].should_not be_nil
    end

    it "should return 403 if users exits" do
      user = FactoryGirl.create(:users)
      post :create, {:users => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should_not be_nil
      res['name'].should be_nil
      res['password'].should be_nil
      res['password_confirmation'].should be_nil
    end
  end

  context "When new valid users" do
    it "Should create the users" do
      user = FactoryGirl.build(:users)
      post :create, {:users => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      response.response_code.should==200
      response.body.should == user.email
    end
  end

end