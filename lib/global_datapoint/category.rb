module GlobalDatapoint
  class Category
    def initialize(options)
      @options = options
    end

    def name
      @options.fetch(:name,nil)
    end

    def default?
      @options.fetch(:default?,false)
    end
  end
end
