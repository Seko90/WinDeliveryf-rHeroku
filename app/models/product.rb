class Product < ActiveRecord::Base
	validates :articlenumber, presence: true, uniqueness: true
	belongs_to :category
	has_many :order_items
	has_many :orders, through: :order_items
end
