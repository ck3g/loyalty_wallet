require 'rails_helper'

RSpec.describe CurrentCountCalculator, type: :model do
  describe "#call" do
    subject { described_class.new(total_count).calculate }

    context "when total count is 0" do
      let(:total_count) { 0 }
      it { is_expected.to eq 0 }
    end

    context "when total count is 10 fold" do
      let(:total_count) { 20 }
      it { is_expected.to eq 10 }
    end

    context "otherwise return the rest" do
      let(:total_count) { 14 }
      it { is_expected.to eq 4 }
    end
  end
end
