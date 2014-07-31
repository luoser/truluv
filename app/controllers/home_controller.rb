require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController

	def index
		root_url = 'http://newyork.craigslist.org/'
		url = 'http://newyork.craigslist.org/search/mis/?query=m4w'
		@remote_urls = Array.new
		@blurbs = Array.new

		begin
			doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
			rows = doc.css('.row')

			rows[1..11].each do |row|
				hrefs = row.css('a').map{ |x|
					x['href']}.compact.uniq
				hrefs.each do |href|
					remote_url = root_url + href
					@remote_urls << root_url

					tdoc = Nokogiri::HTML(open(remote_url, 'User-Agent' => 'ruby'))
					@blurbs << tdoc.at_css('#postingbody').text
				end
			end
		rescue
			puts 'could not access url'
			render partial: 'error'
		end
	end

end