module GlobalDatapoint
  module Builders
    class TitleBuilder
      def self.build(xml)
        new(xml).build
      end

      attr_reader :images
      def initialize(xml)
        @xml = xml.children
        begin
          @images = xml.search('image').map(&:children).flatten.map(&:children).flatten.map(&:text)
        rescue
          @images = []
        end
      end

      def title_id
        attribute_for('title_id')
      end

      def created_date
        date_for(attribute_for('created_date'))
      end

      def modified_date
        date_for(attribute_for('modified_date'))
      end

      def date_for(date)
        Date.strptime(date, '%d/%m/%Y')
      end

      def name
        attribute_for('title_name')
      end

      def description
        attribute_for('title_description')
      end

      def type
        attribute_for('title_type')
      end

      def short_description
        attribute_for('title_shortdescription')
      end

      def categories
        CategoryBuilder.build(@xml.search('category'))
      end

      def sub_categories
        CategoryBuilder.build(@xml.search('subcategory'))
      end

      def attribute_for(attr)
        begin
          @xml.search(attr).first.children.text
        rescue
          ""
        end
      end

      def build
        Title.new(
          :title_id => title_id,
          :created_date => created_date,
          :modified_date => modified_date,
          :name => name,
          :description => description,
          :type => type,
          :short_description => short_description,
          :categories => categories,
          :sub_categories => sub_categories,
          :image => images.first
        )
      end
    end
  end
end
