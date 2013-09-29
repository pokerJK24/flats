class FlatsController < ApplicationController

	def new
		@flat = Flat.new
		@coordinate = @flat.build_coordinate
	end

	def index
		@flats = Flat.all
	end


	def show
		@flat = Flat.find(params[:id])
		@coordinate = @flat.coordinate
	end


	def create
		@flat = Flat.new(flat_params)
		@coordinate = @flat.create_coordinate({x: params[:flat][:coordinates][:x], 
			y: params[:flat][:coordinates][:y]})
		
		if @flat.save
  			redirect_to @flat
  		else
  			render 'new'
  		end
  		#render text: params[:flat][:coordinates].inspect and return
	end

private

	def coordinate_params
		params[:flat][:coordinates]
	end

	def flat_params
		 params.require(:flat).permit(:price, :address, coordinate: [:x, :y])
	end

end
