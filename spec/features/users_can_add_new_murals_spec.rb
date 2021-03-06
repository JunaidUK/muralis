require "rails_helper"

feature "visitors can add new murals" do
  scenario "user adds new mural successfully" do
    @user = User.create!(first_name: "Josh",last_name: "Wyman",email:"google2@gmail.com",password:"123456")
    sign_in @user

    visit new_mural_path
    expect(page).to have_content "New Mural Form"

    photo = "#{Rails.root}/spec/support/images/BasqWarhol.jpeg"

    fill_in 'Title', with: "Basquiat"
    fill_in 'Description', with: "Test Desc"
    fill_in 'Location', with: "The Barbican"
    attach_file "Photo", "#{Rails.root}/spec/support/images/BasqWarhol.jpeg"

    click_button "Add Mural"

    expect(page).to have_content "Mural was successfully created"
    expect(page).to have_content "Basquiat"
  end

  scenario "user does not provide expected information for a mural" do
    @user = User.create!(first_name: "Josh", last_name: "Wyman", email:"google1@gmail.com", password:"123456")
    sign_in @user

    visit new_mural_path
    expect(page).to have_content "New Mural Form"

    click_button "Add Mural"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Location can't be blank"
    expect(page).to have_content "Photo can't be blank"
  end
end
