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
        element = @xml.select {|e| e.name = 'title_id'}
      end

      def build
      end
    end
  end
end
