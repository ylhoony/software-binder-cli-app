class SoftwareBinder::Software
  attr_accessor :name, :overall_rating, :reviews, :description, :page_slug
  attr_reader :category

  @@all = []

  def initialize(category)
    @category = category
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
