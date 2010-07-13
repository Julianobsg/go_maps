require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoMaps::Direction do
  context 'on #to_map' do
    before :each do
      @address1, @address2 = 'Invalid Address 1', 'Invalid Address 2'
    end

    it 'should return a map' do
      GoMaps::Direction.new(:from => @address1, :to => @address2).to_map.should eql("<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?ie=UTF8&output=embed&saddr=#{@address1}&daddr=#{@address2}'></iframe>")
    end

    it 'should accept width as an option' do
      GoMaps::Direction.new(:from => @address1, :to => @address2).to_map(:width => 333).include?('width=\'333\'').should be_true
    end

    it 'should accept height as an option' do
      GoMaps::Direction.new(:from => @address1, :to => @address2).to_map(:height => 444).include?('height=\'444\'').should be_true
    end
  end
end
