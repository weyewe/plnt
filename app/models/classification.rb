require 'combo'
class Classification < ActiveRecord::Base
  include Combo
  belongs_to :category
end
