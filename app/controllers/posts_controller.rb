class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def index
    @posts = Post.order(post_date: :desc)
    @news_headines = News.new("bloomberg").get_titles
  end

  def get_news_source
    @posts = Post.order(post_date: :desc)
    @news_headines = News.new(params[:news]).get_titles
    @current = params[:news]
    render '/posts/index/'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def post_data
    post = Post.find(params[:id])
    #render json: PostSerializer.serialize(post)
    render json: post.to_json(only: [:title, :description, :id],
                              include: [author: { only: [:name]}])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted."
    redirect_to posts_path
  end



  private

  def post_params(*args)
    params.require(:post).permit(:title, :content, :post_date, :author_id)
  end
end
