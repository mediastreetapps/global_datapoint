module GlobalDatapoint
  class Title
    def self.build_from(xml)
      Builders::TitleListBuilder.build(xml)
    end
  end
end
