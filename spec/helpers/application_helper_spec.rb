require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#page_title' do
    subject { page_title(str) }

    context "引数に空文字が与えられた時" do
      let(:str) { "" }
      it { is_expected.to eq 'Wind Instrument Reviews Please' }
    end

    context "引数にnilが与えられた時" do
      let(:str) { nil }
      it { is_expected.to eq 'Wind Instrument Reviews Please' }
    end

    context "引数がある時" do
      let(:str) { 'title' }
      it { is_expected.to eq 'title - Wind Instrument Reviews Please' }
    end
  end
end
