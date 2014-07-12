class CardsController < ApplicationController

	BASE_CRAIGSLIST_URL = 'http://newyork.craigslist.org/search/mis/?query=m4w'

	def index
		@cards = Card.all
	end

	def show

	end

	def new

	end

	def create

	end

	def update

	end
end