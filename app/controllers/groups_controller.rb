class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:payments).where(author: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, notice: 'Group Not created.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
