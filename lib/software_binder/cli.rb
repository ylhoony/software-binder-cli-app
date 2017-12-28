class SoftwareBinder::CLI

  @@last_category_search = []

  def call
    puts "Welcome to Software Binder!"
    load_categories
    list_categories
    list_software
    reset?
  end

  def load_categories
    @@last_category_search.clear
    SoftwareBinder::Category.reset
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
      find_by_alphabet = SoftwareBinder::Category.find_by_alphabet(input)
      if find_by_alphabet.size > 0
        find_by_alphabet.each.with_index(1) do |category, i|
          @@last_category_search << category
          puts "#{i}. #{category.name}"
        end
      else
        puts "There is no result for your search."
        self.list_categories
      end
    else
      find_by_keyword = SoftwareBinder::Category.find_by_keyword(input)
      if find_by_keyword.size > 0
        find_by_keyword.each.with_index(1) do |category, i|
          @@last_category_search << category
          puts "#{i}. #{category.name}"
        end
      else
        puts "There is no result for your search."
        self.list_categories
      end
    end
  end

  def list_software

  end

  def reset?

  end

end
