require 'spec_helper'
require_relative '../../app/models/admin'

RSpec.describe Admin do
  context 'creation' do
    before(:each) do
      @admin = FactoryGirl.build(:admin)
    end
    it '.initialize id' do
      expect(@admin.id).to eq nil
    end
    it '.initialize name' do
      expect(@admin.name).to eq 'admin'
    end
    it '.initialize password' do
      expect(@admin.password).to eq 'admin.123'
    end
    it '.initialize status' do
      expect(@admin.status).to eq 2
    end
  end
end
