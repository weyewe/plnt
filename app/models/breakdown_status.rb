require 'combo'

class BreakdownStatus < ActiveRecord::Base
  include Combo
  has_many :breakdowns
end
