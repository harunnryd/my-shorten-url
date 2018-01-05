require "rails_helper"

describe ShortenUrlService::Show do
  context "ShortenUrlService::Show" do
    before(:each) do
      response = -> (obj) { return obj }
      success = -> (obj) { return obj }
      failure = -> { return false }
      params = {url: 'https://medium.com/how-to-train-your-frog'}

      @shorten_url_exist = ShortenUrlService::Create.call(params, response: response)

      @shorten_url_1 = ShortenUrlService::Show.call(@shorten_url_exist.shorten, success: success, failure: failure)
      @shorten_url_2 = ShortenUrlService::Show.call('bBg', success: success, failure: failure)
    end

    it "give an url if shorten exists" do
      expect(@shorten_url_exist.url).to eq("https://medium.com/how-to-train-your-frog")
      expect(@shorten_url_1.present?).to eq(true)
    end

    it "return false if shorten not exists" do
      expect(@shorten_url_2).to eq(false)
    end
  end
end
