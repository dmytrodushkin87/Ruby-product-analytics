class Product < ActiveRecord::Base
	belongs_to :categories
	has_and_belongs_to_many :users
end
