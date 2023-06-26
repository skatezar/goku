class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end
	
	def show
		@blog = Blog.find(params[:id])
	end
	
	def create
		@blog = Blog.new(blog_params)
		if @blog.save
		    redirect_to root_path
		else
		    render :new
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		if @blog.update(blog_params)
	      redirect_to @blog, notice: 'all good'
	    else
	      render :edit
	    end
	end

	private

	def blog_params
		params.require(:blog).permit(:title, :para1, :para2, :para3, :para4, :para5, :desc)
	end
end
