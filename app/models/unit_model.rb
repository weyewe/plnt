require "combo"
class UnitModel < ActiveRecord::Base
  include Combo
  belongs_to :manufacturer
end
