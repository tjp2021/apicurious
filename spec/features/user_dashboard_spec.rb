feature "user sees github page info" do
  it "displays user info,and overview information " do
    VCR.use_cassette("user_dashboard_display") do
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
end
