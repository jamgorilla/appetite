class PubsController < ApplicationController
	
	def index
		if params[:search].present? and params[:search][:q].present? and Pub.near[:search][:q].present?
			flash.now[:success] = "Pubs near #{params[:search][:q]}"
			@pubs = Pub.near(params[:search][:q])
		elsif params[:search].present? and params[:search][:q].present?
			flash.now[:error] = "Sorry we didn't find any Pubs near #{params[:search][:q]}"
			@pubs = Pub.all
		else
			@pubs = Pub.all
		end	
	end


	def new
		@pub = Pub.new
	end

	def create
		@pub = Pub.new(pub_params)
		if @pub.save

			flash[:success] = "Thank you for submitting a pub"
			redirect_to root_path

		else

			flash[:error] = "That's not a real place."
			render :new

		end
		
	end

private
	def pub_params
		params.require(:pub).permit(:title, :address, :latitude, :longitude)
	end
end


