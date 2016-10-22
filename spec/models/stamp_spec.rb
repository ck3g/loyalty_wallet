require 'rails_helper'

RSpec.describe Stamp, type: :model do
  it "has a valid factory" do
    expect(create :stamp).to be_valid
  end
end
