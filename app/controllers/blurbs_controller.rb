class BlurbsController < ApplicationController

	def index
		@blurbs = Blurb.all
	end

	def show
		@blurb = Blurb.find params[:id]
	end

end