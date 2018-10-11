require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

def deputes
  	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions/(vue)/tableau"))

    first_name =  page.css("td:nth-child(2)")
    last_name = page.css("td:nth-child(3)")

    arrayfirstname=[]
    first_name.each do |i|
      namefirst = i.text
      arrayfirstname << namefirst
end

  arraylastname=[]
  last_name.each do |i|
  lastname = i.text
  arraylastname << lastname
end

hash = Hash[arrayfirstname.zip(arraylastname)]
puts hash.map {|arrayfirstname,arraylastname|{:firstname=>arrayfirstname,:lastname=>arraylastname}}



def get_the_email_of_deputys(link)
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{link}"))
    nodeset = page.css("#haut-contenu-page > article > div.contenu-principal.en-direct-commission.clearfix > div > dl > dd:nth-child(8) > ul > li:nth-child(1) > a[href]")
    puts nodeset.map {|element| element["href"].delete_prefix("mailto:")}
end

def get_the_profile_links
    contact = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions/(vue)/tableau")).css("td:nth-child(8) a")
    contact.each{|link| get_the_email_of_deputys(link['href'].delete_prefix('.'))}
end


end
deputes
get_the_profile_links
