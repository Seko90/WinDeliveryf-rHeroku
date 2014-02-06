class Customer < ActiveRecord::Base
	has_many :orders
	validates :TNummer, presence: true, uniqueness: true
end
