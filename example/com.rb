require "dmm/api"
require "yaml"
require "pp"
config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')
Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = "DMM.com"
end
res = Dmm::Api.get({:service => 'lod',:floor => 'nmb48',:keyword => "山本彩",:hits => "1"})
p res["result"]["result_count"]
# p res[:result][:items][:item]
# res["result"]["items"]["item"].each do |v|
#   pp v #["title"]
# end
