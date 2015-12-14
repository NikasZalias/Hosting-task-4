require 'spec_helper'
require_relative '../../app/models/hosting'
require_relative '../../app/models/admin'
require_relative '../../app/models/server'

RSpec.describe Hosting do
  context 'creation' do
    before(:each) do
      @hosting = FactoryGirl.create(:hosting)
      @admin = FactoryGirl.create(:admin)
      @user = FactoryGirl.create(:user)
      @wrong_user = FactoryGirl.create(:user_fake)
      @server = FactoryGirl.create(:server_one)
      @domain = FactoryGirl.create(:domain_one)
    end

    it '.add_admin' do
      @hosting.add_admin(@admin)
      expect(@hosting.admins).to include(@admin)
    end

    it '.add_user' do
      @hosting.add_user(@user)
      expect(@hosting.users).to include(@user)
    end

    it '.del_user' do
      @hosting.add_user(@user)
      @hosting.del_user(@user.id)
      expect(@hosting.users.length).to eq 0
    end

    it '.del_admin' do
      @hosting.add_admin(@admin)
      @hosting.del_admin(@admin.id)
      expect(@hosting.admins.length).to eq 0
    end

    it '.change_title' do
      @hosting.change_title('new0title')
      expect(@hosting.title).to eq 'new0title'
    end

    it '.block_user' do
      @hosting.add_admin(@admin)
      @hosting.add_user(@user)
      @hosting.block_user(@user.id, @admin)
      @user.reload
      expect(@user.blocked).to eq true
    end

    it '.unblock_user' do
      @hosting.add_admin(@admin)
      @hosting.add_user(@wrong_user)
      @hosting.block_user(@wrong_user.id, @admin)
      @wrong_user.reload
      expect(@wrong_user.blocked).to eq false
    end

    it '.login' do
      @hosting.add_user(@user)
      result = @hosting.login('nzaliauskas@gmail.com', 'nikas.12.pass')
      expect(result).to eq true
    end

    it '.admin_login user fail' do
      @hosting.add_user(@user)
      @hosting.add_admin(@admin)
      result = @hosting.admin_login('nzaliauskas@gmail.com', 'nikas.12.pass')
      expect(result).to eq false
    end

    it '.admin_login' do
      @hosting.add_admin(@admin)
      result = @hosting.admin_login('admin', 'admin.123')
      expect(result).to eq true
    end

    it '.edit' do
      @hosting.add_user(@user)
      @hosting.edit(@user, 'address_new', 863_555_444)
      @user.reload
      expect(@user.address).to eq 'address_new'
    end

    it '.add_domain' do
      @hosting.add_user(@user)
      @hosting.add_domain('www.nikodemas.lt', @user)
      @user.reload
      expect(@user.domains_name).to eq 'www.nikodemas.lt'
    end

    it '.add_domain result begin check' do
      @hosting.add_user(@user)
      @hosting.add_domain('www.nikodemas.lt', @user)
      @user.reload
      expect(@user.domains_name).to start_with 'www.'
    end

    it '.add_domain result end check' do
      @hosting.add_user(@user)
      @hosting.add_domain(@domain.name, @user)
      @user.reload
      expect(@user.domains_name).to end_with '.lt'
    end

    it '.pay_for_hosting' do
      @hosting.add_user(@user)
      @hosting.pay_for_hosting(@user)
      @user.reload
      expect(@user.current_money_count).to eq 400
    end

    it '.add_domain check to increase by wanted number' do
      @hosting.add_user(@user)
      @hosting.add_domain('www.nikodemas.lt', @user)
      @hosting.add_domain('www.zaliauskas.lt', @user)
      @hosting.add_domain('www.zaliauskas1.lt', @user)
      @user.reload
      expect(@user.domain_count).to fantastic_four
    end

    it '.add_domain check hosting money' do
      @hosting.add_user(@user)
      @hosting.add_domain('www.nikodemas.lt', @user)
      @hosting.add_domain('www.nikodemas1.lt', @user)
      @hosting.add_domain('www.nikodemas2.lt', @user)
      @hosting.add_domain('www.nikodemas3.lt', @user)
      expect(@hosting.current_money_count).to eq 504_00
    end

    it '.pay_for_server' do
      @hosting.pay_for_server(@user, @server)
      expect(@user.current_money_count).to eq 485
    end

    it '.add_server' do
      @hosting.add_server(@server)
      expect(@hosting.servers.last.name).to eq 'Simple'
    end

    it '.del_server' do
      @hosting.add_server(@server)
      @hosting.del_server(@server.id)
      expect(@hosting.servers.length).to eq 0
    end

    it '.add_server_to_user' do
      @hosting.add_user(@user)
      @hosting.add_server(@server)
      @hosting.add_server_to_user(@user, 'Simple')
      expect(@user.server).to start_with 'Simple'
    end

    it '.add_server_to_user payment' do
      @hosting.add_user(@user)
      @hosting.add_server(@server)
      @hosting.add_server_to_user(@user, 'Simple')
      @user.reload
      expect(@user.current_money_count).to eq 485
    end

    it '.add_server_to_user date check' do
      @hosting.add_user(@user)
      @hosting.add_server(@server)
      @hosting.add_server_to_user(@user, 'Simple')
      expect(@user.server).not_to end_with((Time.now.to_date + 365).to_s)
    end
  end
end
