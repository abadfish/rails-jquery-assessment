class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
  end

  def show
    @author = Author.find(params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @author }
    end
  end

  def author_data
    author = Author.find(params[:id])
    render json: author.to_json(only: [:name, :hometown, :id], include: [posts: {only: [:title, :content]}])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Author deleted."
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
end
