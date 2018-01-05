require 'rails_helper'

describe LogService::Create do
  context 'LogService::Create' do

    let(:log) { LogService::Create.call(:info, "halo sejasa", 'info_services.log') }
    let(:size) { File.readlines("#{Rails.root}/log/info_services.log").grep(/halo sejasa/).size }

    it 'generate log file info_services.log with msg' do
      expect(log).to eq(true)
      expect(size > 0).to eq(true)
    end

  end

end
