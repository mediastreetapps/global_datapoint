module GlobalDatapoint
  module Builders
    class CategoryBuilder
      def self.build(categories_xml)
        categories_xml.each do |category|
          new(category).build
        end
      end

      def initialize(category)
        @category = category
      end

      def default?
        if @category.attributes.include?("default")
          return true if @category.attributes["default"].value == "Yes"
        end
        false
      end

      def name
        @category.children.first.text
      end

      def build
        Category.new(:name => name, :default? => default?)
      end
    end
  end
end
