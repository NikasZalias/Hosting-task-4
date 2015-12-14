require 'spec_helper'
require_relative '../../app/models/server'

RSpec.describe Server do
  context 'creation' do
    before(:each) do
      @server_simple = FactoryGirl.build(:server_one)
    end
    it '.initialize id' do
      expect(@server_simple.id).to eq nil
    end
    it '.initialize name' do
      expect(@server_simple.name).to eq 'Simple'
    end
    it '.initialize price' do
      expect(@server_simple.price).to eq 15
    end
  end
end
