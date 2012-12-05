module GlobalDatapoint
  class Event
    def self.build_from(xml)
      Builders::EventBuilder.build(xml.search('venue'))
    end
  end
end
