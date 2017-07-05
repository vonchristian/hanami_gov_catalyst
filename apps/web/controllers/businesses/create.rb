module Web::Controllers::Businesses
  class Create
    include Web::Action
    
    expose :book 
    params do 
    	required(:business).schema do 
    		required(:name).filled(:str?)
    	end
    end
    def call(params)
    	if params.valid?
    	  @business = BusinessRepository.new.create(params[:business])
    	  redirect_to '/businesses'
    	else
    		self.status = 422
    	end
    end
  end
end
