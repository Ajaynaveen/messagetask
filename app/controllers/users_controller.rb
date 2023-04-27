class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user)
  end
  def search
    @searched_user = User.find_by(email: params[:email])

    if @searched_user
      @conversations_with_searched_user = Conversation.between(current_user.id, @searched_user.id)
    else
      flash[:notice] = "User not found"
      redirect_to users_path
    end
  end
end
