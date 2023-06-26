class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
		    redirect_to root_path
		else
		    render :new
		end
	end

	private

	def blog_params
		params.require(:mailform).permit(:title, :para1, :para2, :para3, :para4, :para5, :desc)
	end
end
