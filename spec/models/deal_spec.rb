require 'rails_helper'

RSpec.describe Deal, type: :model do
  it "has a valid factory" do
    expect(create :deal).to be_valid
  end

  describe ".active" do
    let!(:active_deal) { create :deal }
    let!(:expired_deal) { create :deal, valid_from: 2.days.ago, valid_till: 1.day.ago }
    let!(:upcomming_deal) { create :deal, valid_from: 2.days.from_now, valid_till: 3.days.from_now }

    subject { Deal.active }

    it "returns only active deals" do
      is_expected.to eq [active_deal]
    end
  end

  describe ".has_deal_this_day?" do
    let!(:deal) do
      create :deal, valid_from: 3.days.from_now, valid_till: 10.days.from_now
    end

    subject { Deal.has_deal_this_day? day }

    context "when day is on 4th day from now" do
      let(:day) { 4.days.from_now }
      it { is_expected.to be_truthy }
    end

    context "when day is on 2th day from now" do
      let(:day) { 2.days.from_now }
      it { is_expected.to be_falsey }
    end

    context "when day is on 11th day from now" do
      let(:day) { 11.days.from_now }
      it { is_expected.to be_falsey }
    end
  end
end
