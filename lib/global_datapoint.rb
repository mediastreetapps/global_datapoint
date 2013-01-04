require 'nokogiri'
require 'httparty'
require "global_datapoint/version"
require "global_datapoint/builders/venue_builder"
require "global_datapoint/builders/event_builder"
require "global_datapoint/builders/category_builder"
require "global_datapoint/builders/title_builder"
require "global_datapoint/builders/title_list_builder"
require "global_datapoint/performance"
require "global_datapoint/venue"
require "global_datapoint/event"
require "global_datapoint/category"
require "global_datapoint/title"

module GlobalDatapoint
  def self.build_from(input)
    xml = Nokogiri::XML(input)
    begin
      type = xml.children.first.name
      return Title.build_from(xml) if type == 'titlelist'
      return Event.build_from(xml) if type == 'listings'
      return Venue.build_from(xml) if type == 'venuelist'
    rescue
      puts "Cannot process file"
    end
  end
end
