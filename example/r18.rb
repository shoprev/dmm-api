require "dmm/api"
config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')
Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = config["site"]
end
d = Dmm::Api.get({:service => 'digital',:floor => 'videoa',:keyword => "菜月アンナ"})
    # let(:service) { 'digital' }
    # let(:floor) { 'videoa' }
    # let(:keyword) { "菜月アンナ" }
p d