require 'spec_helper'

describe GlobalDatapoint do
  context 'build_from' do
    it 'builds a title from a titlelist file' do
      filename = File.expand_path('../../fixtures/TITLES_EXAMPLE.xml', __FILE__)
      file = File.open(filename)
      titlelist = double
      GlobalDatapoint::Title.stub(:build_from) { titlelist }
      GlobalDatapoint.build_from(file).should == titlelist
    end
  end
end
