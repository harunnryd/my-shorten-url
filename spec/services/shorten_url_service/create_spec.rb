require "rails_helper"

describe ShortenUrlService::Create do
  context "ShortenUrlService::Create" do
    before(:each) do
      response = -> (obj) { return obj }
      params_1 = {url: 'https://medium.com/how-to-playing-football'}
      params_2 = {
        custom: 'on',
        url: 'https://medium.com/how-to-playing-barbie',
        shorten: 'htpBbie'
      }
      params_3 = {
        custom: 'on',
        url: 'https://medium.com/how-to-playing-barbie',
        shorten: 'htpBbie*!^$!*'
      }

      # ------------------------------------------------
      # Service
      # ------------------------------------------------
      @shorten_url_1 = ShortenUrlService::Create.call(
        params_1,
        response: response
      )
      @shorten_url_2 = ShortenUrlService::Create.call(
        params_1,
        response: response
      )
      @shorten_url_3 = ShortenUrlService::Create.call(
        params_2,
        response: response
      )
      @shorten_url_4 = ShortenUrlService::Create.call(
        params_3,
        response: response
      )
    end

    it 'should give object value' do
      expect(@shorten_url_1.shorten).to eq('b')
      expect(@shorten_url_3.shorten).to eq('htpBbie')
    end

    it 'should give error' do
      expect(@shorten_url_2.errors.full_messages_for :url).to contain_exactly('Url already registered')
      expect(@shorten_url_4.errors.full_messages_for :shorten).to contain_exactly('Shorten only contains numeric, character')
    end
  end
end
