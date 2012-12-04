module GlobalDatapoint
  class Category
    def initialize(options)
      @options = options
    end

    def name
      @options.fetch(:name,nil)
    end

    def parent_category
      @options.fetch(:parent_category,nil) if sub_category?
    end

    def sub_category?
      @options.fetch(:sub_category?, false)
    end

    def default?
      @options.fetch(:default?,false)
    end
  end
end
