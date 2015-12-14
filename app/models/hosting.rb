require 'yaml'
require 'active_record'
require 'rubygems'
require 'user'
require 'admin'
require 'server'
require 'domain'
require 'rspec/matchers'

# This is comment
class Hosting < ActiveRecord::Base
  has_many :users
  has_many :admins
  has_many :servers
  has_many :domains

  validate :account_number

  def add_admin(admin_obj)
    update_attributes admins: admins.push(admin_obj)
  end

  def add_user(user_obj)
    update_attributes users: users.push(user_obj)
  end

  def add_server(server_obj)
    update_attributes servers: servers.push(server_obj)
  end

  def del_admin(admin_id)
    admins.destroy(Admin.find(admin_id))
  end

  def del_user(user_id)
    users.destroy(User.find(user_id))
  end

  def del_server(server_id)
    servers.destroy(Server.find(server_id))
  end

  def change_title(new_title)
    self.title = new_title
  end

  def block_user(user_id, admin)
    temp_id = user_id
    return unless admins.find(admin.id)
    users.find(temp_id).block
  end

  def login(email, password)
    user = users.find_by(email: email, password: password)
    user.is_a?(User) ? true : false
  end

  def admin_login(name, password)
    admin = admins.find_by(name: name, password: password)
    admin.is_a?(Admin) ? true : false
  end

  def edit(user, address, number)
    user = users.find(user.id)
    return false unless user
    user.edit(address, number)
    users
  end

  def add_domain(domain_name, user)
    user = users.find(user.id)
    return false unless user
    user.domain_name(domain_name)
    pay_for_hosting(user) unless user.domains_count(1) == 5
    users
  end

  def pay_for_hosting(user)
    temp_user = user
    User.find_each do |user_search|
      if user_search == temp_user
        user_search.balance(-100)
        self.current_money_count += 100
      end
    end
  end

  RSpec::Matchers.define :fantastic_four do
    match do |actual|
      4 == actual
    end
  end

  def pay_for_server(user, server)
    price = server.price
    user.balance(-price)
    self.current_money_count += price
    user
  end

  def add_server_to_user(user, server_name)
    user = users.find(user.id)
    server = servers.find_by(name: server_name)
    return false unless server.is_a?(Server)
    user.server = server_name + ' ' + (Time.now.to_date).to_s
    pay_for_server(user, server)
  end
end
