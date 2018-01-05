require 'rails_helper'

describe ShortenUrlForm::Create do
  context "[custom = 'off'] ShortenUrlForm" do
    before(:each) do
      @suf_1 = ShortenUrlForm::Create.new(url: '')
      @suf_2 = ShortenUrlForm::Create.new(url: 'halo')
      @suf_3 = ShortenUrlForm::Create.new(url: 'https://sejasa.com')
    end

    it "should give an errors" do
      expect(@suf_1.valid?).to eq(false)
      expect(@suf_1.errors.size).to eq(2)
      expect(@suf_2.valid?).to eq(false)
      expect(@suf_2.errors.size).to eq(1)
    end

    it "data valid" do
      expect(@suf_3.valid?).to eq(true)
      expect(@suf_3.errors.size).to eq(0)
    end
  end

  context "[custom = 'on'] ShortenUrlForm" do
    before(:each) do
      @suf_1 = ShortenUrlForm::Create.new(url: '', custom: 'on')
      @suf_2 = ShortenUrlForm::Create.new(url: 'halo', custom: 'on')
      @suf_3 = ShortenUrlForm::Create.new(url: 'https://sejasa.com', custom: 'on')
      @suf_4 = ShortenUrlForm::Create.new(
        custom: 'on',
        url: 'https://medium.com/how-to-play-barbie',
        shorten: '&^%$!$'
      )
      @suf_5 = ShortenUrlForm::Create.new(
        custom: 'on',
        url: 'https://medium.com/how-to-play-barbie',
        shorten: 'HtpBarbie'
      )
    end

    it 'should give invalid data and errors size' do
      expect(@suf_1.valid?).to eq(false)
      expect(@suf_2.valid?).to eq(false)
      expect(@suf_3.valid?).to eq(false)
      expect(@suf_4.valid?).to eq(false)
      expect(@suf_1.errors.size).to eq(4)
      expect(@suf_2.errors.size).to eq(3)
      expect(@suf_3.errors.size).to eq(2)
      expect(@suf_4.errors.size).to eq(1)
    end

    it "data valid" do
      expect(@suf_5.valid?).to eq(true)
      expect(@suf_5.errors.size).to eq(0)
    end
  end
end
