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

      def build
        Title.new(:title_id => title_id)
      end
    end
  end
end
