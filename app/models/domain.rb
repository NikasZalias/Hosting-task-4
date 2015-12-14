require 'yaml'

# This is Domain class
class Domain < ActiveRecord::Base
  belongs_to :server
  belongs_to :user
  belongs_to :admin
  belongs_to :hosting

  validate :price
  validates :name, length: { minimum: 3,
                             maximum: 32,
                             too_short: 'at least %{count} letters',
                             too_long: 'at most %{count} letters' }
end
