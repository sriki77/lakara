require 'spec_helper'

describe Vachanam do

  context "Check seeded data in database" do
    it "should return 3 vachanas" do
      Vachanam.all.length.should==3
    end
  end
end
