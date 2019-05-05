Given(/^I open the BBC sitemap$/) do
  opened_sitemap = open('https://www.bbc.co.uk/news/localnews/locations/sitemap.xml')
  @xml_document = Nokogiri(opened_sitemap)
end

Then(/^I can validate the first (\d+) links in the sitemap xml$/) do |max|
  links = @xml_document.css('loc').map(&:text)[1..max]

  Parallel.map(links, in_threads: 10) do |link|
    response = Net::HTTP.get_response(URI(link))

    valid_link = response.is_a?(Net::HTTPSuccess)
    print "#{link}  #{valid_link}\n"
    expect(valid_link).to be true
  end
end
