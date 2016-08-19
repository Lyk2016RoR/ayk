class WritersController < ApplicationController
		before_action :set_writer, only: [:show, :update, :edit, :destroy]


	def new
		@writer = Writer.new
		end

	def index
		@writers = Writer.all
	end

	def show
		@writer = Writer.find(params[:id])
	end

	def create
			@writer = Writer.new(strong_params)

 				if @writer.save
			redirect_to writer_path(@writer)
 				else
			render :new
		end


	end

	def edit

	end

	def update
			if @writer.update(writer_params)
			redirect_to writer_path(@writer)
		else
			render :edit
		end
	end

	def destroy
		@writer.destroy
		redirect_to writers_path
	end

private

	def writer_params
		params.require(:writer).permit(:name, :bio)
	end


	def set_writer
		@writer = Writer.find(params[:id])
	end

	def strong_params
		params.require(:writer).permit(:name, :bio)
	end
end
