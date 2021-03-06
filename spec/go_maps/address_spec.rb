require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GoMaps::Address do
  context 'on #exists?' do
    it 'should return true given a valid address' do
      address = 'Valid Address'
      map_address_to_file address, 'address_success'
      GoMaps::Address.new(address).exists?.should be_true
    end

    it 'should return false given an invalid address' do
      address = 'Invalid Address'
      map_address_to_file address, 'address_error'
      GoMaps::Address.new(address).exists?.should be_false
    end
  end

  context 'on #distance_to' do
    it 'should return the distance given valid addresses' do
      address1, address2 = 'Valid Address 1', 'Valid Address 2'
      map_addresses_to_file address1, address2, 'distance_success_10.8'
      GoMaps::Address.new(address1).distance_to(address2).should == 10.8
    end

    it 'should raise AddressNotFoundException given invalid addresses' do
      address1, address2 = 'Invalid Address 1', 'Invalid Address 2'
      map_addresses_to_file address1, address2, 'distance_error'
      lambda { GoMaps::Address.new(address1).distance_to(address2) }.should raise_error(GoMaps::AddressNotFoundException)
    end
  end

  context "on #latitude" do
    it "should return the address latitude" do
      address = 'Valid Address'
      map_address_to_file address, 'address_success'
      GoMaps::Address.new(address).latitude.should eql(-20.801184)
    end
  end

  context "on #longitude" do
    it "should return the address longitude" do
      address = 'Valid Address'
      map_address_to_file address, 'address_success'
      GoMaps::Address.new(address).longitude.should eql(-49.3747043)
    end
  end

  context "when requesting coordenates" do
    it "should call the Google Maps service only once" do
      address = 'Valid Address'
      map_address_to_file address, 'address_success'
      gomaps = GoMaps::Address.new address
      gomaps.latitude
      gomaps.should_not_receive(:open)
      gomaps.longitude
    end
  end
end

