class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.belongings.build
  end

  def index
    @belongings = current_user.belongings
  end

  def create
  	@group = Group.new(group_params)
    @group.belongings.build user: current_user
    if @group.save
      redirect_to  groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def show
    @belongings = Belonging.where(user_id: current_user.id)
  end

  private
    def group_params
    	params.require(:group).permit(:name,:caption)
    end
end