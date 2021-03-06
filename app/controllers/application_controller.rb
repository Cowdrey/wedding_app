require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class BioProfile
    def initialize(name, imageUrl, bioTitle, bioText)
      @name = name
      @imageUrl = imageUrl
      @bioTitle = bioTitle
      @bioText = bioText
    end

    attr_reader :name, :imageUrl, :bioTitle, :bioText
  end

  def get_bios_from_JSON(filePath)
    biosJSON = JSON.parse(File.read(filePath))
    biosList = []
    biosJSON['bios'].each do |bio|
      biosList.push(BioProfile.new(bio['name'], bio['imageUrl'], bio['bioTitle'], bio['bioText']))
    end
    biosList
  end

  before_action :populate_bios
  def populate_bios
    jsonDir = ::Rails.root.join('app', 'assets', 'bio_jsons')
    @groomPartyBios = get_bios_from_JSON(jsonDir.join('groom_party.json'))
    @bridePartyBios = get_bios_from_JSON(jsonDir.join('bride_party.json'))
  end

  def index
    render 'application/index'
  end
end
