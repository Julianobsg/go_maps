require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoMaps::CEP do
  context 'given valid cep' do
    before :each do
      map_url_to_file 'http://cep.republicavirtual.com.br/web_cep.php?cep=01310-000', 'cep_success'
      @cep = GoMaps::CEP.new('01310-000')
    end

    context 'on #street' do
      it 'should return the street' do
        @cep.street.should eql('Avenida Paulista')
      end
    end

    context 'on #city' do
      it 'should return the city' do
        @cep.city.should eql('São Paulo')
      end
    end

    context 'on #uf' do
      it "should return the uf" do
        @cep.uf.should eql('SP')
      end
    end
  end

  context 'given invalid cep' do
    it 'should raise AddressNotFoundException' do
      map_url_to_file 'http://cep.republicavirtual.com.br/web_cep.php?cep=12345-678', 'cep_error'
      lambda { @cep = GoMaps::CEP.new('12345-678') }.should raise_error(GoMaps::AddressNotFoundException)
    end
  end
end
