require 'spec_helper'

describe UsersController do

  context "When Insufficient information" do

    it "should return 400 for missing user" do
      post :create
      response.response_code.should==400
    end

    it "should return 403 for missing user data" do
      post :create, {:user => {}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should_not be_nil
      res['name'].should_not be_nil
      res['password'].should_not be_nil
    end

    it "should return 403 for missing user name, password" do
      post :create, {:user => {:email => 'cooker@gmail.com'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should be_nil
      res['name'].should_not be_nil
      res['password'].should_not be_nil
    end

    it "should return 403 for missing user password" do
      post :create, {:user => {:email => 'cooker@gmail.com', :name => 'hawkings'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should be_nil
      res['name'].should be_nil
      res['password'].should_not be_nil
    end
  end

  context "When input is invalid" do

    it "should return 403 if user name length is invalid" do
      post :create, {:user => {:name => 'a', :email => 'a@a.com', :password => 'p', :password_confirmation => 'p'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['name'].should_not be_nil
      post :create, {:user => {:name => 'c_b_c', :email => 'a@a.com', :password => 'p', :password_confirmation => 'p'}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['name'].should_not be_nil
    end

    it "should return 403 if user exits" do
      user = FactoryGirl.create(:user)
      post :create, {:user => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      response.response_code.should==403
      res=JSON.parse(response.body)
      res['email'].should_not be_nil
      res['name'].should be_nil
      res['password'].should be_nil
      res['password_confirmation'].should be_nil
    end
  end

  context "When new valid user" do
    it "Should create the user" do
      user = FactoryGirl.build(:user)
      post :create, {:user => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      response.response_code.should==200
      response.body.should == user.email
    end
  end

end