class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = Entity.all.where(category_id: params[:group_id])
  end

  def new
    @groups = Group.all.where(author: current_user.id)
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    @group = Group.find(params[:group_id])
    if params[:category_id] == '0'
      redirect_to new_group_entity_path(@group), notice: 'Category Not selected. Transaction not created'
    else
      @category = Group.find(params[:category_id])
      @entity = @category.entities.build(entity_params.merge(author_id: current_user.id, category: @category))

      if @entity.save
        redirect_to group_entities_path(@category), notice: 'Entity was successfully created.'
      else
        render :new, notice: 'Entity Not created.'
      end
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :category_id, :author_id)
  end
end
