require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

	def  get_the_email_of_a_townhal_from_its_webpage(href)
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{href}"))
		email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	  puts email.text
	end


def  get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
links = page.css("a.lientxt")

links = links.each{|link| get_the_email_of_a_townhal_from_its_webpage(link['href'].delete_prefix("."))}
puts links
end

get_all_the_urls_of_val_doise_townhalls
