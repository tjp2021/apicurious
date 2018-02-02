
class Repository

  attr_reader :name, :language, :description, :update_time


  def initialize(attrs = {})
    @name = attrs[:name]
    @language = attrs[:language]
    @description = attrs[:description]
    @update_time = attrs[:updated_at]
  end





end
