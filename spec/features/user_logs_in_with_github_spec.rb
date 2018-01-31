describe "user logs in" do
  scenario "using github oauth" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_content("Timothy Joo")
    
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
