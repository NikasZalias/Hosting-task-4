require 'spec_helper'
require_relative '../../app/models/user'

RSpec.describe User do
  context 'creation' do
    before(:each) do
      @user = FactoryGirl.build(:user)
    end
    it '.initialize name' do
      expect(@user.name).to eq 'Nikas'
    end

    it '.initialize surname' do
      expect(@user.surname).to eq 'Zalias'
    end

    it '.initialize address' do
      expect(@user.address).to eq 'Giedros 7'
    end

    it '.initialize number' do
      expect(@user.number).to eq 863_330_226
    end

    it '.initialize account_number' do
      expect(@user.account_number).to eq 'LT123456789987654'
    end

    it '.initialize password' do
      expect(@user.password).to eq 'nikas.12.pass'
    end

    it '.initialize id' do
      expect(@user.id).to eq nil
    end

    it '.initialize email' do
      expect(@user.email).to eq 'nzaliauskas@gmail.com'
    end

    it '.initialize person_type' do
      expect(@user.person_type).to eq 'Person'
    end

    it '.initialize company_name' do
      expect(@user.company_name).to eq 'Google'
    end

    it '.initialize country' do
      expect(@user.country).to eq 'Lithuania'
    end
  end
end
