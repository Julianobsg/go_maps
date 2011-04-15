module GoMaps
  class CEP
    def initialize(cep)
      @response = Nokogiri::XML(open("http://cep.republicavirtual.com.br/web_cep.php?cep=#{cep}"))
      raise GoMaps::AddressNotFoundException if element('resultado') == "0"
    end

    def street
      "#{element('tipo_logradouro')} #{element('logradouro')}"
    end

    def city
      element 'cidade'
    end

    def uf
      element 'uf'
    end

    private

    def element(name)
      @response.xpath("//#{name}").inner_text
    end
  end
end
