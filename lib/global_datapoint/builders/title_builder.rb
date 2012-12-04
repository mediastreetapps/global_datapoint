module GlobalDatapoint
  module Builders
    class TitleBuilder
      def self.build(xml)
        new(xml).build
      end

      def initialize(xml)
        @xml = xml.children
      end

      def title_id
        @xml.search('title_id').first.children.text
      end

      def created_date
        date_for(@xml.search('created_date').first.children.text)
      end

      def modified_date
        date_for(@xml.search('modified_date').first.children.text)
      end

      def date_for(date)
        Date.strptime(date, '%d/%m/%Y')
      end

      def name
        @xml.search('title_name').first.children.text
      end

      def description
        @xml.search('title_description').first.children.text
      end

      def type
        @xml.search('title_type').first.children.text
      end

      def short_description
        @xml.search('title_shortdescription').first.children.text
      end

      def build
        Title.new(
          :title_id => title_id,
          :created_date => created_date,
          :modified_date => modified_date,
          :name => name,
          :description => description,
          :type => type,
          :short_description => short_description
        )
      end
    end
  end
end
