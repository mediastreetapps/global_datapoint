module GlobalDatapoint
  class Title
    def self.build_from(xml)
      Builders::TitleListBuilder.build(xml)
    end

    def initialize(options)
      @options = options
    end

    def title_id
      @options.fetch(:title_id, nil)
    end
  end
end
