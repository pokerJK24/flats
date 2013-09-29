class Flat < ActiveRecord::Base
	has_one :coordinate, :dependent => :destroy
	accepts_nested_attributes_for :coordinate
	validates :price, numericality: { only_integer: true, greater_than: 0 }

end
