require 'rails_helper'
require 'json'

RSpec.describe ApplicationController do
  describe '#get_bios_from_JSON' do
    it 'should be able to parse bio JSONs' do
      mockName = 'mockName'
      mockImageUrl = 'mockImagUrl'
      mockBioText = 'mockBioText'
      mockJSONBioArr = [{:name => mockName, :imageUrl => mockImageUrl, :bioText => mockBioText}]
      mockJSONBio = {:bios => mockJSONBioArr}.to_json
      
      allow(File).to receive(:read).with(any_args).and_return(mockJSONBio)

      results = controller.get_bios_from_JSON('dummyPath')
      expect(results.length).to eq(1)
      
      bioResult = results[0]
      expect(bioResult.name).to eq(mockName)
      expect(bioResult.imageUrl).to eq(mockImageUrl)
      expect(bioResult.bioText).to eq(mockBioText)
    end
  end

  describe '#populate_bios' do
    it 'should populate the bios instance arrays' do
      mockJSONDir = double('mockJSONDir')
      mockJSONGroomDir = double('mockJSONGroomDir')
      mockJSONBrideDir = double('mockJSONBrideDir')

      allow(::Rails).to receive_message_chain('root.join').with(any_args).and_return(mockJSONDir)
      allow(mockJSONDir).to receive(:join).with('groom_party.json').and_return(mockJSONGroomDir)
      allow(mockJSONDir).to receive(:join).with('bride_party.json').and_return(mockJSONBrideDir)

      expectedGroomBios = double('expectedBrideBios')
      expectedBrideBios = double('expectedBrideBios')

      allow(controller).to receive(:get_bios_from_JSON).with(mockJSONGroomDir).and_return(expectedGroomBios)
      allow(controller).to receive(:get_bios_from_JSON).with(mockJSONBrideDir).and_return(expectedBrideBios)

      controller.populate_bios()

      expect(controller.instance_variable_get(:@groomPartyBios)).to be(expectedGroomBios)
      expect(controller.instance_variable_get(:@bridePartyBios)).to be(expectedBrideBios)
    end
  end
end
