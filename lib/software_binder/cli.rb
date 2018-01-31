class SoftwareBinder::CLI

  @@last_category_search = []

  def call
    puts "Welcome to Software Binder!"
    load_categories
    list_categories
    list_softwares
    reset?
  end

  def load_categories
    self.class.last_category_search.clear
    SoftwareBinder::Software.reset
    SoftwareBinder::Category.reset
    SoftwareBinder::Scraper.scrape_categories
  end

  def self.last_category_search
    @@last_category_search
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
    elsif input.to_i == 100
      result = SoftwareBinder::Category.find_by_keyword("")[0 .. 99]
      result.each.with_index(1) do |category, i|
        @@last_category_search << category
        puts "#{i}. #{category.name}"
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

  def list_softwares
    puts "Please enter the category index number, or type 'exit' to quit"
    input = gets.strip
    exit if input == 'exit'
    if !input.to_i.between?(1, self.class.last_category_search.size)
      puts "It is not valid input."
      self.list_softwares
    else
      selected_category = self.class.last_category_search[input.to_i - 1]
      SoftwareBinder::Scraper.scrape_softwares(selected_category)
      SoftwareBinder::Software.all.each.with_index(1) do |list, i|
        puts "#{i}. #{list.name}"
        puts "Review Rating: #{list.overall_rating}/5.0 from #{list.reviews} reviews"
        puts "Description: #{list.description}"
        puts
      end
    end
  end

  def reset?
    puts "Would you like to check other software? (Y/N)"
    answer = gets.strip
    case answer.downcase
    when "y"
      self.call
    when "n"
      exit
    else
      puts "I do not understand your answer"
      puts "Please answer with Y or N"
      self.reset?
    end
  end

end
