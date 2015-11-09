class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end


  
end
