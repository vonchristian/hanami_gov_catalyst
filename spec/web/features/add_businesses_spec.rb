require 'features_helper'

describe 'Add a business' do 
	after do 
		BusinessRepository.new.clear 
	end

	it 'can create a new business' do 
		visit '/businesses/new'

		within 'form#business-form' do 
			fill_in 'Name', with: "Test Shop"
			click_button "Create"
		end
		expect(current_path).to eql('/businesses')
		expect(page).to have_content("Test Shop")
	end 
	it 'displays list of errors when params contains errors' do
    visit '/businesses/new'

    within 'form#business-form' do
      click_button 'Create'
    end

    expect(current_path).to eql('/businesses')
    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Name must be filled')
  end
end 