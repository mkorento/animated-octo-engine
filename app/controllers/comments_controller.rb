class CommentsController < ApplicationController
  # POST /comments
  def create
     @comment = Comment.new(comment_params)

     if @comment.save
       redirect_to :back
     else
       render 'images#show'
     end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:nickname, :content, :image_id)
    end
end
