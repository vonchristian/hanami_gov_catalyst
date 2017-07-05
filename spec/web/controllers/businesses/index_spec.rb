require 'spec_helper'
require_relative '../../../../apps/web/controllers/businesses/index'

describe Web::Controllers::Businesses::Index do 
	let(:action) { Web::Controllers::Businesses::Index.new }
	let(:params) { Hash[] }
	let(:repository) { BusinessRepository.new }

	before do 
	  repository.clear 
	  @business = repository.create(name: "Test Shop")
	end  
  
  it 'is successful' do 
  	response = action.call(params)
  	expect(response[0]).to eq 200
  end 

  it 'exposes all businesses' do 
  	action.call(params)
  	expect(action.exposures[:businesses]).to eq [@business]
  end 
end 