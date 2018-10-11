require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

def crypto
  	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=577&lang=fr"))
    name = page.css("h2.titre_normal").text
    mail =  page.css(" html.ltr.fr.no-js body.pas_surlignable.page_annuaires div.page main.main div.wrapper div#content.content div.main-block.large-gutter ul.no_puce.list_ann li a.ann_mail")
puts mail.text
end
crypto
/html/body/div/main/div/div/div/ul/li//a[2]

"html.ltr.fr.no-js body.pas_surlignable.page_annuaires div.page main.main div.wrapper div#content.content div.main-block.large-gutter ul.no_puce.list_ann li a.ann_mail"
