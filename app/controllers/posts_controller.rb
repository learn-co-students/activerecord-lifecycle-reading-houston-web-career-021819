class PostsController < ApplicationController
	def index
		@posts = Post.all 
	end

	def show
		@post = Post.find(params[:id])
	end
 
	def new 
		@post = Post.new
	end

	def create  
		@post.new(posts_params)
		@post.save
	  redirect_to post_path(@post)
	end

	def update
		#byebug
		@post = Post.find(params[:id]) 
		#byebug
		my_post = @post.update(posts_params)
		#byebug
		redirect_to post_path(@post)
	end 

	def edit
	  @post = Post.find(params[:id])
	end

	private
	def posts_params
		params.require(:post).permit(:title, :description)
	end
end