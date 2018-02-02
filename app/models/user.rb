class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
                      provider: auth[:provider],
                      uid: auth[:uid],
                      nickname: auth[:info][:nickname],
                      name: auth[:info][:name],
                      token: auth[:credentials][:token]
                      }

    user.save!

    user
  end

end
