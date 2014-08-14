class Pub < ActiveRecord::Base
	
	geocoded_by :address
	before_validation :geocode

	validates :title, presence: true, uniqueness: true
	validates :address, presence: true, uniqueness: true
	validates :latitude, presence: true, uniqueness: true
	validates :longitude, presence: true, uniqueness: true
	
	
end
