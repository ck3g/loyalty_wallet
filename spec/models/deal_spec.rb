require 'rails_helper'

RSpec.describe Deal, type: :model do
  it "has a valid factory" do
    expect(create :deal).to be_valid
  end
end
