class Commit

  attr_reader :message, :full_name, :commit_date

  def initialize(attrs = {})
    @message = attrs[:commit][:message]
    @full_name = attrs[:repository][:name]
    @commit_date = attrs[:commit][:committer][:date]
  end

end
