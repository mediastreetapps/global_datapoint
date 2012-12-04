module GlobalDatapoint
  module Builders
    class TitleListBuilder
      def self.build(xml)
        new(xml).build
      end

      def initialize(xml)
        @xml = xml
      end

      def titles
        @xml.search('title')
      end

      def build
        titles.map { |title| TitleBuilder.build(title) }
      end
    end
  end
end

