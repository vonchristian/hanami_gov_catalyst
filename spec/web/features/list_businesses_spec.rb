require 'features_helper'

describe 'List businesses' do 
	let(:repository) { BusinessRepository.new }
	before do 
		repository.clear 
		repository.create(name: "Test Shop")
		repository.create(name: "Another Test Shop")
   end
	it 'displays each business on the page' do 
		visit '/businesses'
		within '#businesses' do 
			expect(page).to have_css('.business', count: 2)
		end 
	end 
end 