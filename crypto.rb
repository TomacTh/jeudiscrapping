require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

def crypto
  	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    name = page.css("a.currency-name-container.link-secondary")
    price = page.css("a.price")


    array1=[]
    name.each do |i|
    name2= i.text
    array1 << name2
    end

    array2=[]
    price.each do |i|
      price2= i.text
      array2 << price2
    end

    hash = Hash[array1.zip(array2)]
    puts hash.map {|array1,array2|{:name=>array1,:price=>array2}}

end

  crypto
