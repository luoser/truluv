class Blurb < ActiveRecord::Base

	validates :body, uniqueness: true

end