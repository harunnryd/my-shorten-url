require 'rails_helper'

describe ShortenService::Encode do
  context "ShortenService::Encode" do

    before(:each) do
     @primary_k1 = 1997
     @primary_k2 = 02
     @primary_k3 = 20
     @primary_k4 = 2018
    end

    it "generate a shorten url" do
      expect(ShortenService::Encode.call(@primary_k1)).to eq('Gn')
      expect(ShortenService::Encode.call(@primary_k2)).to eq('c')
      expect(ShortenService::Encode.call(@primary_k3)).to eq('u')
      expect(ShortenService::Encode.call(@primary_k4)).to eq('GI')
    end

  end
end
