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
      software.description = element.css(".listing-description").text.strip.gsub(/\s{2,}/,' ').gsub(" Learn more about #{software.name}",'')
      software.page_slug = element.css(".listing-description a").attr("href").value

      if !element.css(".reviews").empty?
        software.overall_rating = element.css(".reviews").attr("data-rating").value.split("/")[0]
        software.reviews = element.css(".reviews").attr("data-rating").value.split(" - ")[1]
      else
        software.overall_rating = "0.0"
        software.reviews = 0
      end
    end
  end

end
