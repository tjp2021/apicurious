describe "user logs in" do
  it "using github oauth" do
    VCR.use_cassette("github_oath_login") do
      stub_omniauth
      visit root_path
      expect(page).to have_link("Sign in with Github")
      click_link "Sign in with Github"
      expect(page).to have_content("Timothy Joo")

    end
  end
end

  
