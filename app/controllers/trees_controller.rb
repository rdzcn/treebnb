class TreesController < ApplicationController
before_action :set_tree, only: [ :show, :update, :destroy ]

  def index
    if params[:search]
      @trees = Tree.where(location: params[:search])
    else
      @trees = Tree.all
    end
  end

  def show
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    if @tree.save
      redirect_to tree_path(@tree)
    else
      render :new
    end
  end

  def update
    @tree.update(tree_params)
    redirect_to tree_path(@tree)
  end

  def destroy
    @tree.destroy
    redirect_to trees_path
  end

  private

  def set_tree
    @tree = Tree.find(params[:id])
  end

  def tree_params
    params.require(:tree).permit(:location, :price_per_night, :photo, :avalable, :capacity)
  end
end



