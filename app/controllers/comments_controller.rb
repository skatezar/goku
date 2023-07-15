class CommentsController < ApplicationController
  def create
    @ukfinancejob = Ukfinancejob.find(params[:ukfinancejob_id])
    @comment = @ukfinancejob.comments.create(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @ukfinancejob
    else
      render 'ukfinancejobs/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end