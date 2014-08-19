require "dmm/api"
require "yaml"
require "pp"

config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')

Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = "DMM.com"
end

# version 0.1.3
# res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "山本彩",:hits => "1"})
# pp res["result"]["result_count"]
# pp res["result"]["items"]["item"]["title"]

# version 0.2.0 and later
res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "nmb48",:hits => "1"})
pp res["result"][0]["result_count"][0]
pp res["result"][0]["items"][0]["item"][0]["title"][0]

# version 0.1.3
# res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "山本彩"})
# res["result"]["items"]["item"].each do |v|
#   pp v["title"]
# end

# version 0.2.0 and later
res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "nmb48"})
res["result"][0]["items"][0]["item"].each do |v|
  pp v["title"][0]
end