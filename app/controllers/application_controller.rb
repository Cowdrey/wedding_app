require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class BioProfile
    def initialize(name, imageUrl, bioText)
      @name = name
      @imageUrl = imageUrl
      @bioText = bioText
    end

    attr_reader :name, :imageUrl, :bioText
  end
  
  def get_bios_from_JSON(filePath)
    biosJSON = JSON.parse(File.read(filePath))
    biosList = Array.new
    biosJSON["bios"].each { |bio|
      biosList.push(BioProfile.new(bio["name"], bio["imageUrl"], bio["bioText"]))
    }
    biosList
  end

  before_action :populate_bios
  def populate_bios
    jsonDir = ::Rails.root.join('app', 'assets', 'bio_jsons')
    @groomPartyBios = get_bios_from_JSON(jsonDir.join('groom_party.json'))
    @bridePartyBios = get_bios_from_JSON(jsonDir.join('bride_party.json'))
  end

  def index
    render "application/index"
  end
end
