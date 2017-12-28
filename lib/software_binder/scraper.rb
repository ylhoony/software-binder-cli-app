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

  def self.scrape_softwares(category)
    html = open("https://www.capterra.com/#{category.slug}")
    doc = Nokogiri::HTML(html)

    doc.css(".listing").each do |element|
      software = SoftwareBinder::Software.new(category)
      software.name = element.css(".listing-name a").text.strip
      software.overall_rating = element.css(".reviews") == nil ? 0 : element.css(".reviews").attribute("data-rating").value.split("/")[0]
      software.reviews = element.css(".reviews") == nil ? 0 : element.css(".reviews").attribute("data-rating").value.split(" - ")[1]
      software.description = element.css(".listing-description").text.strip
      software.page_slug = element.css(".listing-description a").attribute("href").value
      binding.pry
    end
  end

end
