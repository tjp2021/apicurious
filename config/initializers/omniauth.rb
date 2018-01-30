Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github,
    ENV["GITHUB_KEY"],
    ENV["GITHUB_SECRET"],
    {
    :name => "github",
    :scope => ["user, repo, gist"],
    :image_aspect_ration => "square",
    :image_size => 50
    }
end
