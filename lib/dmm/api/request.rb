module Dmm

  class Request

    def self.get(path,opts)
      # uri = URI.parse("#{path}?#{opts.map{|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}")
      uri = URI.escape("#{path}?#{opts.map{|k,v|"#{k}=#{v}"}.join('&')}".encode('euc-jp'))
      # uri = URI.escape(uri.encode('euc-jp','utf-8'))
      # puts uri.encoding
      # URI.escape(uri.encode!("euc-jp","utf-8"))
      # p uri.encoding
      # url = URI.escape(uri) #.encode("euc-jp","utf-8")
      # puts url
      # uri = URI.escape(uri)
# p d = HTTParty.get(url)
# d = Net::HTTP.get_response(URI.parse(url))
# p d.body #uri

      # http = Net::HTTP.new(uri.host, uri.port)
      # d = http.start {http.get(uri.request_uri)}
      # d = open(url).read
      Dmm::Response.new(Net::HTTP.get_response(URI.parse(uri)))
    end

  end

end

