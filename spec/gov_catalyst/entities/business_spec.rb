RSpec.describe Business do
  it 'can be initialized with attributes' do 
  	business = Business.new(name: "Test Shop")
  	expect(business.name).to eql( "Test Shop")
  end
end
