require 'spec_helper'

describe Dhatu do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  context "Create dhatus of different types and validate" do
    it "should create dhatus with one roopa" do
      d1=FactoryGirl.build(:dhatu_with_one_roopa)
      d1.save
      Dhatu.all.length.should==1
      Roopa.all.length.should==1
      Padam.all.length.should==2
      Lakaras.all.length.should==10
      Purusha.all.length.should==3
      Vachanam.all.length.should==3
    end

    it "should create dhatus with two roopas" do
      d1=FactoryGirl.build(:dhatu_with_two_roopas)
      d1.save
      Dhatu.all.length.should==1
      Roopa.all.length.should==2
      Padam.all.length.should==2
      Lakaras.all.length.should==10
      Purusha.all.length.should==3
      Vachanam.all.length.should==3
      end
  end
end
