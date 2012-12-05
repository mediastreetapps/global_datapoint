module GlobalDatapoint
  class Venue
    attr_reader :events
    def initialize(options)
      @options = options
      @events = []
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
  end
end
