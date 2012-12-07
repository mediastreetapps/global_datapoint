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

      def build_venue
        Venue.new(:venue_id => venue_id, :name => venue_name)
      end

      def build_title(title_options)
        title = Title.new(
          :title_id => title_options.attributes['title_id'].value,
          :name => title_options.attributes['title_name'].value
        )
      end

      def build_performance(performance_options, title)
        Performance.build_from(performance_options, title)
      end

      def build_events(event_options, performance)
        event_options.search('event').map do |event|
          event = Event.new(
            :event_id => event.attributes['event_id'].value,
            :start_date => Date.strptime(event.attributes['event_start_date'].value, '%d/%m/%Y'),
            :end_date => Date.strptime(event.attributes['event_end_date'].value, '%d/%m/%Y'),
            :start_time => event.attributes['event_start_time'].value,
            :end_time => event.attributes['event_end_time'].value,
            :note => event.attributes['event_note'].value,
            :booking_link => event.children.detect {|e| e.name == 'booking_link'}.text,
            :ticketmaster_link => event.children.detect {|e| e.name == 'ticketmaster_link'}.text,
            :performance => performance
          )
        end
      end

      def build_performances_for(venue)
        @xml.search('title').each do |title_xml|
          title = build_title(title_xml)
          performance_xml = title_xml.children.detect {|t| t.name == 'performance'}
          performance = build_performance(performance_xml, title)
          event_xml = title_xml.children.detect {|t| t.name == 'events'}
          venue.titles << build_title(title_xml)
          venue.performances << performance
          venue.add_events(build_events(event_xml, performance))
        end
      end

      def build
        venue = build_venue
        build_performances_for(venue)
        venue
      end
    end
  end
end
