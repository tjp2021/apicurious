class Organization

  attr_reader :name, :description, :github

  def initialize(attrs = {})
    @name = attrs[:login]
    @description = attrs[:description]
    @github = attrs[:url]
  end

end
