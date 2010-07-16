module GoMaps
  class Direction
    def initialize(params)
      @from = params[:from]
      @to = params[:to]
    end

    def to_map(options = {})
      options[:width] ||= 425
      options[:height] ||= 350
      "<iframe width='#{options[:width]}' height='#{options[:height]}' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='#{map_url(@from, @to)}'></iframe>"
    end

    def to_html
      Address.new(@from).route_to(@to)['steps'].inject(''){|directions, step| directions << step['html_instructions']}
    end

    private

    def map_url(origin, destination)
      "http://maps.google.com/maps?ie=UTF8&output=embed&saddr=#{origin}&daddr=#{destination}"
    end
  end
end

