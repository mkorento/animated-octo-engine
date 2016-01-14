class CommentsController < ApplicationController
  # POST /comments
  def create
     @comment = Comment.new(comment_params)

     if @comment.save
       redirect_to :back
     else
       errors = []
       @comment.errors.full_messages.each do |message|
          errors.append message
       end
       flash[:error] = errors

       redirect_to image_path comment_params[:image_id]
     end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:nickname, :content, :image_id)
    end
end
