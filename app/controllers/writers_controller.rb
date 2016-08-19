class WritersController < ApplicationController
		before_action :set_writer, only: [:show, :update, :edit, :destroy]


	def new
		@writer = Writer.new
		end

	def index
		@writers = Writer.all
	end

	def show
	end

	def create 

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
end

