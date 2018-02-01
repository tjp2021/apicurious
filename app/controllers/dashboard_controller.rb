class DashboardController < ApplicationController

  def index
    @conn = Faraday.new(:url => "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.token}"
      faraday.adapter                   Faraday.default_adapter
    end

    user_info = @conn.get "/user"
    response = JSON.parse(user_info.body, symbolize_names: true)

    current_user.update(
      location: response[:location],
      bio: response[:bio],
      image: response[:avatar_url],
      following: response[:following],
      followers: response[:followers],
      repo_count: response[:public_repos]
    )





    repo_info = @conn.get "/user/repos?per_page=51"
    repo_response = JSON.parse(repo_info.body, symbolize_names: true)

    @repositories = repo_response.map {|repo| Repository.new(repo)}



  end
end
