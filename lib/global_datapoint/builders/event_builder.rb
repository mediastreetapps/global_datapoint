module GlobalDatapoint
  module Builders
    class EventBuilder
      def self.build(events)
        events.map { |event| new(event).build }
      end

      def initialize(xml)
        @xml = xml
      end

      def venue_id
        @xml.attributes['venue_id'].value
      end

      def venue_name
        @xml.attributes['venue_name'].value
      end

      def build
        venue = Venue.new(:venue_id => venue_id, :name => venue_name)
      end

      class Venue
        def initialize(options)
          @options = options
        end

        def name
          @options.fetch(:name, nil)
        end

        def venue_id
          @options.fetch(:venue_id, nil)
        end
      end
    end
  end
end
