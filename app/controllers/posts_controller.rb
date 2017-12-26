class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    # @post = Post.new(
    #   title: params["post"]["title"],
    #   content: params["post"]["content"]
    # )
    @post = Post.new(posts_params)
    # (
    #   title: params[:title],
    #   content: params[:content]
    # )
    if @post.save
      redirect_to '/'
    else
      flash[:alert] = "제목과 내용이 필수입니다"
      # redirect_to '/posts/new'
      redirect_to :back
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    @post.update(posts_params)
    # (
    #   title: params["post"]["title"],
    #   content: params["post"]["content"]
    # )
    # @post = Post.new(
    #   title: params[:title],
    #   content: params[:content]
    # )
    # redirect_to "/posts/#{@post.id}"
    redirect_to @post
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def posts_params
    params.require(:post).permit(:title, :content)
  end

end
