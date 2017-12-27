class SoftwareBinder::Scraper

  def self.scrape_categories
    html = open("https://www.capterra.com/categories")
    doc = Nokogiri::HTML(html)
    doc.css(".browse-group-list li a").each do |element|
      category = SoftwareBinder::Category.new
      category.name = element.text
      category.slug = element.attribute("href").value
    end
  end

  def self.scrape_softwares

  end

end
