require "dmm/api"
config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')
Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = "DMM.co.jp" #r18
end
res = Dmm::Api.get({:service => 'digital',:floor => 'videoa',:keyword => "菜月アンナ",:hits => "1"})
p res["result"]["result_count"]
# res["result"]["items"]["item"].each do |v|
#   p v["title"]
# end
p res["result"]["items"]["item"]