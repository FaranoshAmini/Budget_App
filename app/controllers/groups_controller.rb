class GroupsController < ApplicationController
  # before_action :require_login
  def index
    # @groups = Group.where(author_id: current_user)
    @groups = Group.all.order(created_at: :desc).includes(:entities)
  end

  def new
    @group = Group.new
  end

  # def create
  #   @new_group = Group.new(group_params)
  #   return unless @new_group.save

  #   flash[:success] = 'Category created successfully.'
  #   redirect_to groups_path
  # end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = 'Category created successfully'
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    return unless @group.destroy

    flash[:success] = 'Category deleted successfully.'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :author_id)
  end
end
