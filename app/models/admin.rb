require 'json'
require 'yaml'

# This is Admin class
class Admin < ActiveRecord::Base
  belongs_to :hosting
  has_many :users
  has_many :servers, through: :users
  has_many :domains, through: :servers

  validates :name, length: { minimum: 3,
                             maximum: 32,
                             too_short: 'at least %{count} letters',
                             too_long: 'at most %{count} letters' }
  validates :password, length: { in: 8..32 }
  validate :status
end
