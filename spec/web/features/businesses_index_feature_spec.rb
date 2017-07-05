require 'features_helper'

describe 'Visit businesses index page' do 
	it 'is successful' do 
		visit '/businesses'
		expect(page).to have_content("Businesses")
	end 
end 