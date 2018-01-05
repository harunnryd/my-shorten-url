require 'rails_helper'

describe ShortenService::Decode do
  context "ShortenService::Decode" do

    before do
      @shorten_1 = "S"
      @shorten_2 = "e"
      @shorten_3 = "J"
      @shorten_4 = "a"
      @shorten_5 = "s"
      @shorten_6 = "A"
      @shorten_7 = "GI"
    end

    it 'decode a shorten url' do
      expect(ShortenService::Decode.call(@shorten_1)).to eq(44)
      expect(ShortenService::Decode.call(@shorten_2)).to eq(4)
      expect(ShortenService::Decode.call(@shorten_3)).to eq(35)
      expect(ShortenService::Decode.call(@shorten_4)).to eq(0)
      expect(ShortenService::Decode.call(@shorten_5)).to eq(18)
      expect(ShortenService::Decode.call(@shorten_6)).to eq(26)
      expect(ShortenService::Decode.call(@shorten_7)).to eq(2018)
    end

  end
end
