require 'spec_helper'

describe Purusha do
  context "Check seeded data in database" do
    it "should return 3 purushas" do
      Purusha.all.length.should==3
    end
  end

end
