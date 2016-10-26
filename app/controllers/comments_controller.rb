class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment, status: 201
  end

  def comment_data
    comment = Post.find(params[:id])
    render json: comment.to_json(only: [:content, :id])
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
