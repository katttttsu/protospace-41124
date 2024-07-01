class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
      redirect_to @prototype
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentence
      render 'prototypes/show'
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
