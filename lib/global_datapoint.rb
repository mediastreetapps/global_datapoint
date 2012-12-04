require 'nokogiri'
require 'httparty'
require "global_datapoint/version"
require "global_datapoint/builders/title_builder"
require "global_datapoint/builders/title_list_builder"
require "global_datapoint/title"

module GlobalDatapoint
  def self.build_from(input)
    xml = Nokogiri::XML(input)
    type = xml.children.first.name
    Title.build_from(xml) if type == 'titlelist'
  end
end
