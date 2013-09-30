module Dmm

  class Response
    def initialize(response)
      @response =response
      @body = Hash.from_xml(@response.body)
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
