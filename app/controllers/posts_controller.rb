class PostsController < ApplicationController
	def index
		@posts = Post.all
		render :index
	end

	def show
		@post = Post.find(params[:id])
		render :show
	end

	def new
		@post = Post.new
		render :new
	end

	def create
	  @post = Post.new(params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description, :post_status, :author_id))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
