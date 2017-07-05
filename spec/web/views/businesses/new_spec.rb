# spec/web/views/businesses/new_spec.rb
require 'spec_helper'
require 'ostruct'
require_relative '../../../../apps/web/views/businesses/new'

describe Web::Views::Businesses::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Name must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/businesses/new.html.erb') }
  let(:view)      { Web::Views::Businesses::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to have_content('There was a problem with your submission')
    expect(rendered).to have_content('Name must be filled')
  end
end
