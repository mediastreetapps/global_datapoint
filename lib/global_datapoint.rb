require 'nokogiri'
require 'httparty'
require "global_datapoint/version"
require "global_datapoint/title"

module GlobalDatapoint
  def self.build_from(input)
    xml = Nokogiri::XML(input)
    Title.build_from(xml)
  end
end
