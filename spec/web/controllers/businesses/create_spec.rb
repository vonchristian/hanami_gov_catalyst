require 'spec_helper'
require_relative '../../../../apps/web/controllers/businesses/create'

describe Web::Controllers::Businesses::Create do
  let(:action) { Web::Controllers::Businesses::Create.new }
  let(:params) { Hash[business: { name: "Test Shop" }] }
  let(:repository) { BusinessRepository.new }

  before do 
  	repository.clear 
  end
  
  it "creates a business" do 
  	action.call(params)
  	business = repository.last

  	expect(business.id).to_not be_nil
  	expect(business.name).to eql("Test Shop")
  end
  it 'is redirects the user to the businesses listing' do
    response = action.call(params)
    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/businesses'
  end

  describe 'with invalid params' do 
  	let(:params) { Hash[business: {} ] }

  	it 'returns HTTP client error' do 
  		response = action.call(params)
  		expect(response[0]).to eql 422
  	end

  	it 'dumps error in params' do 
  		action.call(params)
  		errors = action.params.errors

  		expect(errors.dig(:business, :name)).to eql ["is missing"]
  	end 
  end 
end
