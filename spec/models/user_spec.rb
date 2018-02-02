require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates or updates itself from oauth hash' do
    auth = {
            provider: "github",
            uid: "12345678910",
            info: {
              nickname: "tyjoo26",
              name: "Timothy Joo"
            },
            credentials: {
              token: "abcdefg12345",
              expires: false
            }
          }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq('12345678910')
    expect(new_user.nickname).to eq('tyjoo26')
    expect(new_user.name).to eq("Timothy Joo")
    expect(new_user.token).to eq("abcdefg12345")
    
  end
end
