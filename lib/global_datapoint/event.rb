module GlobalDatapoint
  class Event
    def self.build_from(xml)
      Builders::EventBuilder.build(xml.search('venue'))
    end

    def initialize(options)
      @options = options
    end

    def event_id
      @options.fetch(:event_id, nil)
    end
  end
end
