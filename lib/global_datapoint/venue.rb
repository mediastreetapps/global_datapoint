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
      attribute_for(:venue_name)
    end

    def venue_id
      attribute_for(:venue_id)
    end

    def created_date
      attribute_for(:created_date)
    end

    def modified_date
      attribute_for(:modified_date)
    end

    def description
      attribute_for(:description)
    end

    def address_1
      attribute_for(:venue_address1)
    end

    def address_2
      attribute_for(:venue_address2)
    end

    def neighbourhood
      attribute_for(:neighbourhood)
    end

    def town
      attribute_for(:town)
    end

    def county
      attribute_for(:country)
    end

    def country
      attribute_for(:county)
    end

    def postcode
      attribute_for(:postcode)
    end

    def closed?
      (attribute_for(:closed) == 'no') ? false : true
    end

    def phone_number
      attribute_for(:phone_number)
    end

    def booking_phone_number
      attribute_for(:booking_phone_number)
    end

    def email_address
      attribute_for(:email_address)
    end

    def web_address
      attribute_for(:web_address)
    end

    def facilities_available
      attribute_for(:facilities_available)
    end

    def additional_info
      attribute_for(:additional_info)
    end

    def ticketmaster_venue_link
      attribute_for(:ticketmaster_link)
    end

    def ticketmaster_image
      attribute_for(:venue_ticketmasterimageurl)
    end

    def latitude
      attribute_for(:latitude)
    end

    def longitude
      attribute_for(:longitude)
    end

    def facebook_link
      attribute_for(:facebook_link)
    end

    def twitter_link
      attribute_for(:twitter_link)
    end

    def opening_times
      attribute_for(:venue_opening_times)
    end

    def add_events(new_events)
      new_events.each do |event|
        events << event
      end
    end

    private
    def attribute_for(attr)
      @options.fetch(attr, nil)
    end
  end
end
