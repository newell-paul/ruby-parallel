When(/^I open the BBC sitemap$/) do
  opened_sitemap = open('https://www.bbc.co.uk/news/localnews/locations/sitemap.xml')
  @xml_document = Nokogiri(opened_sitemap)
end

Then(/^I can validate the first (\d+) links in the sitemap xml$/) do |max|
  links = @xml_document.css('loc').map(&:text)[1..max]

  Parallel.map_with_index(links, in_threads: 10) do |link, index|
    response = Net::HTTP.get_response(URI(link))
    valid_link = response.is_a?(Net::HTTPSuccess)
    puts "#{index} #{link} #{valid_link}"
    expect(valid_link).to be true
  end
end
