class SoftwareBinder::Category
  attr_accessor :name, :slug

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
