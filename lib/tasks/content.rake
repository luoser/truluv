desc 'Fetch content'
task :fetch_content => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	root_url = 'http://newyork.craigslist.org/'
	url = 'http://newyork.craigslist.org/search/mis/?query=m4w'

	doc = Nokogiri::HTML(open(url))
	rows = doc.css('.row')

	puts doc.at_css('title').text

	rows[1..-2].each do |row|
		hrefs = row.css('a').map{ |x|
			x['href']}.compact.uniq
		hrefs.each do |href|
			remote_url = root_url + href
			tdoc = tdoc = Nokogiri::HTML(open(remote_url))
			puts tdoc.at_css('#postingbody').text
		end
	end
end