require 'spec_helper'
require_relative '../../app/models/domain'

RSpec.describe Domain do
  context 'creation' do
    before(:each) do
      @domain = FactoryGirl.build(:domain_one)
    end
    it '.initialize id' do
      expect(@domain.id).to eq nil
    end
    it '.initialize name' do
      expect(@domain.name).to eq 'www.domain_one.lt'
    end
    it '.initialize price' do
      expect(@domain.price).to eq 10
    end
  end
end
