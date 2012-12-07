module GlobalDatapoint
  class Venue
    attr_accessor :events, :titles, :performances
    def initialize(options)
      @options = options
      @events = []
      @titles = []
      @performances = []
    end

    def add_event(event)
      @events << event
    end

    def name
      @options.fetch(:name, nil)
    end

    def venue_id
      @options.fetch(:venue_id, nil)
    end

    def add_events(new_events)
      new_events.each do |event|
        events << event
      end
    end
  end
end
