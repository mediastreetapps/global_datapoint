module GlobalDatapoint
  class Title
    def self.build_from(xml)
      Builders::TitleListBuilder.build(xml)
    end

    def initialize(options)
      @options = options
    end

    def title_id
      attribute_for(:title_id)
    end

    def name
      attribute_for(:name)
    end

    def description
      attribute_for(:description)
    end

    def short_description
      attribute_for(:short_description)
    end

    def type
      attribute_for(:type)
    end

    def created_date
      attribute_for(:created_date)
    end

    def categories
      attribute_for(:categories)
    end

    def sub_categories
      attribute_for(:sub_categories)
    end

    def image
      attribute_for(:image)
    end

    def attribute_for(attr)
      @options.fetch(attr,nil)
    end
  end
end
