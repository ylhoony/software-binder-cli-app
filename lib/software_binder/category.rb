class SoftwareBinder::Category
  attr_accessor :name, :slug

  @@all = []

  def initialize
    self.save
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.find_by_keyword(keyword)
    self.all.select do |category|
      category.name.downcase.include?(keyword.downcase)
    end
  end


end
