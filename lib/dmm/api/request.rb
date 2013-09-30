module Dmm

  class Request

    def self.get(path,opts)
      uri = URI.escape("#{path}?#{opts.map{|k,v|"#{k}=#{v}"}.join('&')}".encode('euc-jp'))
      Dmm::Response.new(Net::HTTP.get_response(URI.parse(uri)))
    end

  end

end