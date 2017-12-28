class SoftwareBinder::CLI

  @@last_category_search = []

  def call
    puts "Welcome to Software Binder!"
    load_categories
    list_categories
    list_software
  end

  def load_categories
    SoftwareBinder::Scraper.scrape_categories
  end

  def self.last_category_search
    @@last_category_search.freeze
  end

  def list_categories
    puts "Please enter any Keyword or Alphabet(or '#') to search software categories!"
    puts "or enter 'exit' to quit."
    input = gets.strip
    exit if input == 'exit'
    if input.length == 1
      
    end

  end

  def list_software

  end

end
