require 'open-uri'

class Crawler
	BASE_CRAIGSLIST_URL = 'http://newyork.craigslist.org/search/mis/?query=m4w'

	def crawl
	  page = Nokogiri::HTML(open(BASE_CRAIGSLIST_URL))
	end


end