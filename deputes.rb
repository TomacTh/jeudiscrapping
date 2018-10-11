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

end
deputes
