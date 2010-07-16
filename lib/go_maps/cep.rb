module GoMaps
  class CEP
    def initialize(cep)
      @response = Nokogiri::XML(open("http://www.buscarcep.com.br?formato=xml&cep=#{cep}"))
      raise GoMaps::AddressNotFoundException if element('resultado') != '1'
    end

    def street
      "#{element('tipo_logradouro')} #{element('logradouro')}"
    end

    def city
      element('cidade')
    end

    private

    def element(name)
      @response.css(name).inner_text
    end
  end
end
