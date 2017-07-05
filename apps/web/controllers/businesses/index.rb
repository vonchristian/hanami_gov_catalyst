module Web::Controllers::Businesses 
	class Index 
		include Web::Action

		expose :businesses  

		def call(params)
      @businesses = BusinessRepository.new.all
		end
	end 
end 