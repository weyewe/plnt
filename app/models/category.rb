class Category < ActiveRecord::Base
  has_many :classifications
end
