require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Crawler

	def initialize(url)
    @url = url
  end

  def get_class_items(class)
    data.css(class)
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

end