module GlobalDatapoint
  class Event
    def self.build_from(xml)
      Builders::EventBuilder.build(xml.search('venue'))
    end

    def initialize(options)
      @options = options
    end

    def event_id
      attribute_for(:event_id)
    end

    def start_date
      attribute_for(:start_date)
    end

    def end_date
      attribute_for(:end_date)
    end

    def start_time
      attribute_for(:start_time)
    end

    def end_time
      attribute_for(:end_time)
    end

    def note
      attribute_for(:note)
    end

    def booking_link
      attribute_for(:booking_link)
    end

    def ticketmaster_link
      attribute_for(:ticketmaster_link)
    end

    def attribute_for(attr)
      @options.fetch(attr, nil)
    end
  end
end
