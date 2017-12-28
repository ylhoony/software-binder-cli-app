class SoftwareBinder::CLI

  def call
    puts "Welcome to Software Binder!"
    load_categories
    list_categories
    list_software
  end

  def load_categories
    SoftwareBinder::Scraper.scrape_categories
  end

  def list_categories
    puts "Please enter any Keyword or Alphabet(or '#') to search software categories!"
    puts "or enter 'exit' to quit."
    input = gets.strip
    exit if input == 'exit'
    

  end

  def list_software

  end

end
