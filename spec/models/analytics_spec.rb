require 'rails_helper'

RSpec.describe Analytics do
  describe "#current_cards" do
    subject { Analytics.new(vendor).current_cards }

    let!(:user1) { create :user }
    let!(:user2) { create :user }
    let!(:user3) { create :user }
    let!(:user4) { create :user }
    let!(:user5) { create :user }

    let(:vendor) { create :vendor }

    before do
      create_list :stamp, 2, user: user1, vendor: vendor
      create_list :stamp, 1, user: user2, vendor: vendor
      create_list :stamp, 3, user: user3, vendor: vendor
      create_list :stamp, 1, user: user4, vendor: vendor
      create_list :stamp, 3, user: user5, vendor: vendor
    end

    it "returns proper count of stamps_count => users_count" do
      is_expected.to eq(
        1 => 2, 2 => 1, 3 => 2
      )
    end
  end
end
