require 'spec_helper'

describe Roopa do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  context "Create roopa of different types and validate" do
    it "should create parasmi & atamepadi pada roopa" do
      broopa=FactoryGirl.build(:bhava_roopa)
      mroopa=FactoryGirl.build(:moda_roopa)
      broopa.save
      mroopa.save
      Roopa.all.length.should==2
      Lakaras.all.length.should==10
      Purusha.all.length.should==3
      Vachanam.all.length.should==3
    end
  end
end
