require 'spec_helper'

describe Lakaras do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  context "Check seeded data in database" do
    it "should return 10 lakaras" do
      Lakaras.all.length.should==10
    end
  end
end
