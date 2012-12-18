module GlobalDatapoint
  module Builders
    class VenueBuilder
      def self.build(xml)
        venues = xml.search('venue')
        venues.select{|v| v.name == 'venue'}.map do |venue|
          new(venue).build
        end
      end

      def initialize(xml)
        @xml = xml
      end

      def venue_id
        @xml.children.search('venue_id').first.text
      end

      def build
        Venue.new(
          :venue_id => venue_id
        )
      end
    end
  end
end
