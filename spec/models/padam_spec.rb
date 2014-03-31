require 'spec_helper'

describe Padam do

  context "Check seeded data in database" do
    it "should return 2 padmas" do
      Padam.all.length.should==2
    end
  end
end
