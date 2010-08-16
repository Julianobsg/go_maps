module GoMaps
  class CEP
    def initialize(cep)
      @response = Nokogiri::XML(open("http://www.bronzebusiness.com.br/webservices/wscep.asmx/cep?strcep=#{cep}"))
      raise GoMaps::AddressNotFoundException if element('tbCEP').blank?
    end

    def street
      "#{element('logradouro')} #{element('nome')}"
    end

    def city
      element('cidade')
    end

    private

    def element(name)
      @response.xpath("//#{name}").inner_text
    end
  end
end
