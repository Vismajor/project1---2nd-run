class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]
  before_filter :load_post

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @post, notice: "Comment was created."
      else
        render :new
      end
    end

    def edit
      @comment = current_user.comments.find(params[:id])
    end

    def update
      @comment = current_user.comments.find(params[:id])
      if @comment.update_attributes(params[:comment])
        redirect_to @post, notice: "Comment was updated."
      else
        render :edit
      end
    end

    def destroy
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to @post, notice: "Comment was destroyed."
    end

  private

    def load_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
