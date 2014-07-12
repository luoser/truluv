require 'rubygems'
require 'open-uri'
require 'nokogiri'

class Crawler
	BASE_CRAIGSLIST_URL = 'http://newyork.craigslist.org/search/mis/?query=m4w'
  page = Nokogiri::HTML(open(BASE_CRAIGSLIST_URL))
  
	

end