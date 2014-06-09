class Museum
  include ActiveModel::Model

  attr_accessor :id, :name

  def initialize(id, name)
    puts "initialize called!"
    @id = id; @name = name
  end
end
