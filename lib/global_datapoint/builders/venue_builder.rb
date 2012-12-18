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
        attribute_for('venue_id')
      end

      def venue_name
        attribute_for('venue_name')
      end

      def created_date
        attribute_for('created_date')
      end

      def modified_date
        attribute_for('modified_date')
      end

      def description
        attribute_for('venue_description')
      end

      def address1
        attribute_for('venue_address1')
      end

      def address2
        attribute_for('venue_address2')
      end

      def neighbourhood
        attribute_for('neighbourhood')
      end

      def town
        attribute_for('town')
      end

      def county
        attribute_for('county')
      end

      def country
        attribute_for('country')
      end

      def closed
        attribute_for('closed')
      end

      def postcode
        attribute_for('postcode')
      end

      def phone_number
        attribute_for('phonenumber')
      end

      def booking_phone_number
        attribute_for('bookingphone')
      end

      def email_address
        attribute_for('emailaddress')
      end

      def web_address
        attribute_for('webaddress')
      end

      def facilities_available
        attribute_for('facilities_available')
      end

      def additional_info
        attribute_for('additional_info')
      end

      def ticketmaster_venue_link
        attribute_for('ticketmaster_venue_link')
      end

      def ticketmaster_image
        attribute_for('venue_ticketmasterimageurl')
      end

      def latitude
        attribute_for('latitude')
      end

      def longitude
        attribute_for('longitude')
      end

      def facebook_link
        attribute_for('facebook_link')
      end

      def twitter_link
        attribute_for('twitter_link')
      end

      def opening_times
        attribute_for('venue_opening_times')
      end

      def build
        Venue.new(
          :venue_id => venue_id,
          :venue_name => venue_name,
          :created_date => created_date,
          :modified_date => modified_date,
          :description => description,
          :venue_address1 => address1,
          :venue_address2 => address2,
          :neighbourhood => neighbourhood,
          :town => town,
          :county => county,
          :country => country,
          :postcode => postcode,
          :phone_number => phone_number,
          :booking_phone_number => booking_phone_number,
          :email_address => email_address,
          :web_address => web_address,
          :facilities_available => facilities_available,
          :additional_info => additional_info,
          :ticketmaster_link => ticketmaster_venue_link,
          :ticketmaster_image => ticketmaster_image,
          :longitude => longitude,
          :latitude => latitude,
          :facebook_link => facebook_link,
          :twitter_link => twitter_link,
          :opening_times => opening_times
        )
      end

      def attribute_for(attr)
        @xml.children.search(attr).first.text
      end
    end
  end
end
