class TreesController < ApplicationController
  before_action :set_tree, only: [ :show, :update, :destroy ]

  def index
    if params[:search] == ""
      @trees = policy_scope(Tree)
    elsif params[:search]
      @trees = policy_scope(Tree)
      @trees = Tree.where(location: params[:search])
    else
      @trees = policy_scope(Tree)
    end
  end

  def show
    @trees = Tree.find(params[:id])
    authorize @trees
  end

  def new
    @tree = Tree.new
    authorize @tree
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    authorize @tree
    if @tree.save
      redirect_to tree_path(@tree)
    else
      render :new
    end
  end

  def edit
    set_tree
    authorize @tree
  end

  def update
    @tree.update(tree_params)
    authorize @tree
    redirect_to tree_path(@tree)
  end

  def destroy
    set_tree
    @tree.destroy
    authorize @tree
    redirect_to trees_path
  end

  private

  def set_tree
    @tree = Tree.find(params[:id])
  end

  def tree_params
    params.require(:tree).permit(:location, :price_per_night, :avalable, :capacity, :description, photos: [])
  end
end



