feature "user sees github page info" do
  scenario "it displays user info,and overview information " do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_content("tyjoo26")
    expect(page).to have_content("Timothy Joo")
    expect(page).to have_content("Aspiring software developer that loves new ideas!")
    expect(page).to have_content("Denver, CO")
  end
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "12345678910",
    info: {
      nickname: "tyjoo26",
      name: "Timothy Joo"
    },
    credentials: {
      token: "abcdefg12345",
      expires: false,
    }
  })
end
