class TreesController < ApplicationController
  before_action :set_tree, only: [ :show, :update, :destroy ]
  skip_before_action :verify_authenticity_token, only: [:update_trees]

  def index
    if params[:search] == ""
      @trees = policy_scope(Tree)
    elsif params[:search] && !Tree.where(address: params[:search]).empty?
      @trees = policy_scope(Tree)
      tree = Tree.where(address: params[:search]).first
      min_lat = tree.latitude - 2
      max_lat = tree.latitude + 2
      max_lng = tree.longitude + 2
      min_lng = tree.longitude - 2
      @trees = Tree.search(min_lat: min_lat, max_lat: max_lat, min_lng: min_lng, max_lng: max_lng )
    else
      @trees = policy_scope(Tree)
    end

    # @map_trees = Tree.where.not(latitude: nil, longitude: nil)
    @markers = @trees.map do |tree|
      {
        lat: tree.latitude,
        lng: tree.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
    if params[:search]
      @trees_filter = params[:search]
    else
      @trees_filter = "" 
    end
  end

  def update_trees
    skip_authorization
    @trees = Tree.search(min_lat: params["minLat"], max_lat: params["maxLat"], min_lng: params["minLng"], max_lng: params["maxLng"] )
    
    Rails.logger.info @trees.map(&:latitude)
    respond_to do |format|
      format.html { render 'trees/index' }
      format.js
    end
  end


  def show
    @tree = Tree.find(params[:id])
    authorize @tree
    if @tree.latitude && @tree.longitude
      @markers = [{
        lat: @tree.latitude,
        lng: @tree.longitude
        }]
      end

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
      params.require(:tree).permit(:location, :price_per_night, :avalable, :capacity, :description, :address, photos: [])
    end

  end




