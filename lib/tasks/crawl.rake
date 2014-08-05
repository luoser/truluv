desc 'Fetch missed connections'

task :crawl_m4w => :environment do
	require 'nokogiri'
	require 'open-uri'

	root_url = 'http://newyork.craigslist.org/'
	url = 'http://newyork.craigslist.org/search/mis/?query=m4w'

	doc = Nokogiri::HTML(open(url))
	rows = doc.css('.row')

	rows.each do |row|
		hrefs = row.css('a').map{ |x| x['href'] }.compact.uniq
		hrefs.each do |href|
			remote_url = root_url + href

			tdoc = Nokogiri::HTML(open(remote_url, 'User-Agent' => 'ruby'))
			blurb_body = tdoc.at_css('#postingbody').text
			Blurb.create(body: blurb_body, seeking: 'm4w')

		end
	end
end

