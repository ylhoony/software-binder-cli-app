class SoftwareBinder::Scraper

  def self.scrape_categories
    html = open("https://www.capterra.com/categories")
    doc = Nokogiri::HTML(html)
    binding.pry
  end

end
