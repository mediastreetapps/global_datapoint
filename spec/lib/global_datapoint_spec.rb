require 'spec_helper'

describe GlobalDatapoint do
  context 'build_from' do
    it 'builds a title from a titlelist file' do
      filename = File.expand_path('../../fixtures/TITLES_EXAMPLE.xml', __FILE__)
      file = File.open(filename)
      GlobalDatapoint.build_from(file).should_not be_empty
    end

    it 'builds events from a listings file' do
      filename = File.expand_path('../../fixtures/EVENT_EXAMPLE.xml', __FILE__)
      file = File.open(filename)
      GlobalDatapoint.build_from(file).should_not be_empty
    end

    it 'builds events from a venuelist file' do
      filename = File.expand_path('../../fixtures/VENUE_EXAMPLE.xml', __FILE__)
      file = File.open(filename)
      GlobalDatapoint.build_from(file).should_not be_empty
    end
  end
end
