require 'active_record'
require 'rubygems'
require 'yaml'
require 'hosting'
require 'admin'
require 'server'
require 'domain'

# This is comment
class User < ActiveRecord::Base
  has_many :admins, through: :hosting
  has_many :domains
  has_many :servers
  belongs_to :hosting

  validate :name

  def block
    blocked ? value = false : value = true
    update_attributes blocked: self.blocked = value
  end

  def edit(address, number)
    update_attributes address: address, number: number
  end

  def domain_name(name)
    update_attributes domains_name: name
  end

  def domains_count(value)
    update_attributes domain_count: self.domain_count += value
  end

  def balance(val)
    update_attributes current_money_count: self.current_money_count += val
  end
end
