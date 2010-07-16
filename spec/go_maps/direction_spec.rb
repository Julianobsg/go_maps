require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoMaps::Direction do
  before :each do
    @address1, @address2 = 'Valid Address 1', 'Valid Address 2'
    @direction = GoMaps::Direction.new(:from => @address1, :to => @address2)
  end

  context 'on #to_map' do
    it 'should return a map' do
      @direction.to_map.should eql("<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?ie=UTF8&output=embed&saddr=#{@address1}&daddr=#{@address2}'></iframe>")
    end

    it 'should accept width as an option' do
      @direction.to_map(:width => 333).include?('width=\'333\'').should be_true
    end

    it 'should accept height as an option' do
      @direction.to_map(:height => 444).include?('height=\'444\'').should be_true
    end
  end

  context 'on #to_html' do
    it 'should return an html' do
      map_addresses_to_file(@address1, @address2, 'direction_success')
      @direction.to_html.include?('Head <b>north</b> on <b>Av. Vinte e Três de Maio</b>').should be_true
    end

    it 'should return an html with a language specified' do
      map_addresses_to_file(@address1, @address2, 'direction_success_pt-BR', :language => 'pt-BR')
      @direction.to_html(:language => 'pt-BR').include?('Siga na direção <b>leste</b> na <b>R. dos Pinheiros</b>').should be_true
    end

    it 'should raise an address not found expection' do
      map_addresses_to_file(@address1, @address2, 'direction_error')
      lambda { @direction.to_html }.should raise_error(GoMaps::AddressNotFoundException)
    end
  end
end
