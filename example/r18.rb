require "dmm/api"
require "yaml"
require "pp"

config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')

Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = "DMM.co.jp"
end

res = Dmm::Api.get({:service => 'digital',:floor => 'videoa',:keyword => "菜月アンナ",:hits => "1"})
pp res["result"]["result_count"]
pp res["result"]["items"]["item"]["title"]

res = Dmm::Api.get({:service => 'digital',:floor => 'videoa',:keyword => "菜月アンナ"})
res["result"]["items"]["item"].each do |v|
  pp v["title"]
end
