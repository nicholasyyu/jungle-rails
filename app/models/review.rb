class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :product, presence: true
  	validates :user, presence: true
  	validates :rating, presence: true, inclusion: 0..5
end
