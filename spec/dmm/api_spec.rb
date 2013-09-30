# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

share_examples_for 'found items' do
  context 'code' do
    it { expect(res.code).to eq 200 }
  end
  context 'size' do
    it { expect(res["result"]["result_count"].to_i).to be > 0 }
  end
end

share_examples_for 'not found items' do
  context 'code' do
    it { expect(res.code).to eq 200 }
  end
  context 'size' do
    it { expect(res["result"]["result_count"].to_i).to eq 0 }
  end
end

describe "Dmm::Api.get" do

  let(:res) {
    VCR.use_cassette('get_' + service.to_s + '_' + floor.to_s + '_' + keyword.to_s) do
      Dmm::Api.get({:service => service,:floor => floor,:keyword => keyword})
    end
  }

  context 'found items' do
    let(:service) { 'digital' }
    let(:floor) { 'videoa' }
    let(:keyword) { "au" }
    it_should_behave_like 'found items'
  end

  context 'not found items' do
    let(:service) { 'digital' }
    let(:floor) { 'videoa' }
    let(:keyword) { 'auaaaaaaaaaaaaaaaaaaaaa' }
    it_should_behave_like 'not found items'
  end

end
