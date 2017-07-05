require 'spec_helper'
require_relative '../../../../apps/web/views/businesses/index'

describe Web::Views::Businesses::Index do 
	let(:exposures) { Hash[businesses: []] }
	let(:template) { Hanami::View::Template.new('apps/web/templates/businesses/index.html.erb')}
	let(:view) { Web::Views::Businesses::Index.new(template, exposures) }
	let(:rendered) { view.render }

	it "exposes #businesses" do 
		expect(view.businesses).to eql(exposures.fetch(:businesses))
	end
	describe 'when there are no businesses' do
	  it 'shows a placeholder message' do 
	    expect(rendered).to include("There are no businesses yet.") 
	  end
	end
	describe 'when there are businesses' do 
		let(:business_1) { Business.new(name: "Test Shop") }
		let(:business_2) { Business.new(name: "Another Test Shop") }
		let(:exposures) { Hash[businesses: [business_1, business_2]] }

		it 'lists them all' do 
			expect(rendered).to include("Test Shop")
			expect(rendered).to include("Another Test Shop")
		end

		it 'hides the placeholder message' do 
			expect(rendered).to_not include('There are no businesses yet.')
		end 
	end 
end 

