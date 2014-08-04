class Blurb < ActiveRecord::Base

	validates :blurb, uniqueness: true
	validates :title, uniqueness: true

end