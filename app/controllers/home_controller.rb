class HomeController < ApplicationController
	require 'open-uri'
	require 'nokogiri'

	def index
		root_url = 'http://newyork.craigslist.org/'
		url = 'http://newyork.craigslist.org/search/mis/?query=m4w'
		@remote_urls = Array.new
		@blurbs = Array.new
		
		begin
			doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
			rows = doc.css('.row')
		rescue => e
			puts e.message
		end

		rows[1..10].each do |row|
			hrefs = row.css('a').map{ |x|
				x['href']}.compact.uniq
			hrefs.each do |href|
				remote_url = root_url + href
				@remote_urls << root_url

				begin
					tdoc = Nokogiri::HTML(open(remote_url, 'User-Agent' => 'Ruby'))
					@blurbs << tdoc.at_css('#postingbody').text
				rescue => e
					puts e.message 
				end

			end
		end
	end

end