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
        @xml.search('event').each do |event|
          event = Event.new(
            :event_id => event.attributes['event_id'].value,
            :start_date => Date.strptime(event.attributes['event_start_date'].value, '%d/%m/%Y'),
            :end_date => Date.strptime(event.attributes['event_end_date'].value, '%d/%m/%Y'),
            :start_time => event.attributes['event_start_time'].value,
            :end_time => event.attributes['event_end_time'].value,
            :note => event.attributes['event_note'].value,
            :booking_link => event.children.detect {|e| e.name == 'booking_link'}.text,
            :ticketmaster_link => event.children.detect {|e| e.name == 'ticketmaster_link'}.text
          )
          venue.add_event(event)
        end
        venue
      end
    end
  end
end
