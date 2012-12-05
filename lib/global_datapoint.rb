require 'nokogiri'
require 'httparty'
require "global_datapoint/version"
require "global_datapoint/builders/event_builder"
require "global_datapoint/builders/category_builder"
require "global_datapoint/builders/title_builder"
require "global_datapoint/builders/title_list_builder"
require "global_datapoint/venue"
require "global_datapoint/event"
require "global_datapoint/category"
require "global_datapoint/title"

module GlobalDatapoint
  def self.build_from(input)
    xml = Nokogiri::XML(input)
    type = xml.children.first.name
    return Title.build_from(xml) if type == 'titlelist'
    return Event.build_from(xml) if type == 'listings'
  end
end
