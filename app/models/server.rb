require 'yaml'
require 'active_record'
require 'rubygems'

# this is comment
class Server < ActiveRecord::Base
  has_many :domains
  belongs_to :hosting
  belongs_to :user
  belongs_to :admin

  validate :price
  validates :name, length: { minimum: 3,
                             maximum: 32,
                             too_short: 'at least %{count} letters',
                             too_long: 'at most %{count} letters' }
end
