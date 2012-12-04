require 'spec_helper'

module GlobalDatapoint
  describe Title do
    context 'build' do
      it 'builds a title from xml' do
        filename = File.expand_path('../../../fixtures/TITLES_EXAMPLE.xml', __FILE__)
        title_xml = Nokogiri::XML(File.open(filename))
        titles = Title.build_from(title_xml)
        titles.should_not be_empty
      end
    end
  end
end
