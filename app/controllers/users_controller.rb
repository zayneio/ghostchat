class UsersController < ApplicationController
  def new
    @group=Group.find_by(slug: params[:group_slug])
    @user=User.new
  end

  def create
    @group=Group.find_by(slug: params[:group_slug])
    @user=User.new(user_params)
    if @user.username.empty?
      @user.random_name
    end
    @user.group = @group
    if @user.save
      session["group_#{@group.id}_user_id"]=@user.id
      redirect_to @group
    else
      flash[:error]=@user.errors.full_messages[0]
      render 'groups/makeusers', locals: {group: @group, user: User.new}, :layout=>'layouts/formlayouts'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
