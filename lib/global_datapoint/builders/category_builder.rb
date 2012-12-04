module GlobalDatapoint
  module Builders
    class CategoryBuilder
      def self.build(categories_xml)
        categories_xml.map { |category| new(category).build }
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

      def sub_category?
        @category.attributes.include?("parent_category")
      end

      def parent_category
        @category.attributes["parent_category"].value
      end

      def name
        @category.children.first.text
      end

      def category_options
        options = {:name => name, :default? => default?}
        options.merge(:parent_category => parent_category) if sub_category?
        options
      end

      def build
        category = Category.new(category_options)
      end
    end
  end
end
