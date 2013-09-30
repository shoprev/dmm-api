module Dmm

  class Response
    def initialize(response)
      @response =response
        # p xml.css("result/")
  # @node = @xml.at('result') # this works if this selects only one node
  # p nodeHash = Hash[*@node.keys().zip(@node.values()).flatten]        
      ActiveSupport::XmlMini.backend = 'Nokogiri'
      @body = ActiveSupport::XmlMini.parse(@response.body)
      # @body = Hash.from_xml(@response.body)

# p       Nokogiri::XML(@response.body)
# p @body
# d = Nokogiri::XML(@response.body,nil,"utf-8")
# p d.xpath("//result")
# p result.root.name.to_s.to_sym
      # @body = Hash.from_xml(@response.body.force_encoding("utf-8"))
# p @body
      @body = @body["response"] if @body.key?("response")
    end

    def code
      @response.code.to_i
    end

    def message
      @response.message
    end

    def method_missing(name, *args, &block)
      if @body.respond_to?(name)
        @body.send(name, *args, &block)
      else
        super
      end
    end

  end

end
