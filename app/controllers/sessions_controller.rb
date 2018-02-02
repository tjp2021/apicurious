class SessionsController < ApplicationController
<<<<<<< HEAD
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    
    redirect_to dashboard_index_path
  end


=======

  def create
    code = params['code']

    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=d47b768c1954f951405b&client_secret=a0118723384eeb0866e6f11f9504ce5febb1f5fc&code=#{code}")

    token = @response.body.split(/\W+/)[1]

    user_info = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(user_info.body)

    user             = User.find_or_create_by(uid: auth["id"])
    user.name        = auth["name"]
    user.username    = auth["login"]
    user.uid         = auth["id"]
    user.token       = token
    user.bio         = auth["bio"]
    user.location    = auth["location"]
    user.avatar_url  = auth["avatar_url"]
    user.save

    session[:user_id] = user.id

  
    redirect_to dashboard_index_path
  end
>>>>>>> master
end
